module NoLoc = struct
  open Atd.Ast

  type annot = annot_section list [@@deriving show]

  and annot_section = string * annot_field list [@@deriving show]

  and annot_field = string * string option [@@deriving show]

  let annot_from_loc annot =
    let to_annot_field (key, (_loc, value)) = key, value in
    let to_annot_section (name, (_loc, annot_field_list)) =
      name, List.map ~f:to_annot_field annot_field_list
    in
    List.map ~f:to_annot_section annot

  module TypeExpr = struct
    type field_kind = Atd.Ast.field_kind =
      | Required
      | Optional
      | With_default
    [@@deriving show]

    type type_inst = string * t list [@@deriving show]

    and variant = (string * annot) * t option [@@deriving show]

    and field = (string * field_kind * annot) * t [@@deriving show]

    and cell = t * annot [@@deriving show]

    and t =
      | Sum of variant list * annot
      | Record of field list * annot
      | Tuple of cell list * annot
      | List of t * annot
      | Option of t * annot
      | Nullable of t * annot
      | Shared of t * annot
      | Wrap of t * annot
      | Name of type_inst * annot
      | Tvar of string
    [@@deriving show]

    let rec type_inst_from_loc (_loc, name, type_expr_list) =
      name, List.map ~f:from_loc type_expr_list

    and variant_from_loc : Atd.Ast.variant -> variant = function
      | Variant (_loc, (name, annot), type_expr) ->
        (name, annot_from_loc annot), Option.map from_loc type_expr
      | Inherit (_loc, _type_expr) ->
        failwith
          "Found an inherited variant. Please use ~inherit_variants:true when \
           loading ATD file."

    and field_from_loc : Atd.Ast.field -> field = function
      | `Field (_loc, (name, field_kind, annot), type_expr) ->
        (name, field_kind, annot_from_loc annot), from_loc type_expr
      | `Inherit (_loc, _type_expr) ->
        failwith
          "Found an inherited field. Please use ~inherit_fields:true when \
           loading ATD file."

    and cell_from_loc (_loc, type_expr, annot) =
      from_loc type_expr, annot_from_loc annot

    and from_loc : Atd.Ast.type_expr -> t = function
      | Sum (_loc, variant_list, annot) ->
        Sum (List.map ~f:variant_from_loc variant_list, annot_from_loc annot)
      | Record (_loc, field_list, annot) ->
        Record (List.map ~f:field_from_loc field_list, annot_from_loc annot)
      | Tuple (_loc, cell_list, annot) ->
        Tuple (List.map ~f:cell_from_loc cell_list, annot_from_loc annot)
      | List (_loc, type_expr, annot) ->
        List (from_loc type_expr, annot_from_loc annot)
      | Option (_loc, type_expr, annot) ->
        Option (from_loc type_expr, annot_from_loc annot)
      | Nullable (_loc, type_expr, annot) ->
        Nullable (from_loc type_expr, annot_from_loc annot)
      | Shared (_loc, type_expr, annot) ->
        Shared (from_loc type_expr, annot_from_loc annot)
      | Wrap (_loc, type_expr, annot) ->
        Wrap (from_loc type_expr, annot_from_loc annot)
      | Name (_loc, type_inst, annot) ->
        Name (type_inst_from_loc type_inst, annot_from_loc annot)
      | Tvar (_loc, name) ->
        Tvar name
  end

  module ModuleItem = struct
    type type_param = string list [@@deriving show]

    type t = (string * type_param * annot) * TypeExpr.t [@@deriving show]

    let from_loc
        (Type (_loc, (name, type_param, annot), type_expr) :
          Atd.Ast.module_item)
      =
      (name, type_param, annot_from_loc annot), TypeExpr.from_loc type_expr
  end
end
