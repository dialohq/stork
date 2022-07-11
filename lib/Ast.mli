module NoLoc : sig
  type annot = annot_section list [@@deriving show]
  and annot_section = string * annot_field list [@@deriving show]
  and annot_field = string * string option [@@deriving show]

  module TypeExpr : sig
    type field_kind = Atd.Ast.field_kind =
      | Required
      | Optional
      | With_default
    [@@deriving show]

    type   type_inst = string * t list [@@deriving show]
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
  end

  module ModuleItem : sig
    type type_param = string list [@@deriving show]
    type t = (string * type_param * annot) * TypeExpr.t [@@deriving show]

    val from_loc : Atd.Ast.module_item -> t
  end
end
