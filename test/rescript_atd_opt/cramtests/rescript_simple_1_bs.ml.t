  $ cd ..
  $ dune exec -- stork gen --rescript --atdgen-opt="-type-attr=genType" *.atd
  $ cat rescript_simple_1_bs.ml | ocamlformat --enable-outside-detected-project --impl -
  (* Auto-generated from "rescript_simple_1.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type 'b tuple_2 = 'b Rescript_simple_1_t.tuple_2
  type skill = Rescript_simple_1_t.skill
  
  type company = Rescript_simple_1_t.company = {
    name : string;
    address : string;
  }
  
  type employer = Rescript_simple_1_t.employer =
    | Self
    | Company of company
  
  type employment = Rescript_simple_1_t.employment
  
  type employee = Rescript_simple_1_t.employee = {
    name : string;
    age : int;
    position : employment;
    prev_position : employment option;
    version : int;
    skills : skill Atdgen_runtime.Util.ocaml_array;
  }
  
  let write_tuple_2 write__b =
    Atdgen_codec_runtime.Encode.tuple2 Atdgen_codec_runtime.Encode.string write__b
  
  let read_tuple_2 read__b =
    Atdgen_codec_runtime.Decode.tuple2 Atdgen_codec_runtime.Decode.string read__b
  
  let write__2 =
    Atdgen_codec_runtime.Encode.tuple2 Atdgen_codec_runtime.Encode.string
      Atdgen_codec_runtime.Encode.string
  
  let read__2 =
    Atdgen_codec_runtime.Decode.tuple2 Atdgen_codec_runtime.Decode.string
      Atdgen_codec_runtime.Decode.string
  
  let write_skill = write__2
  let read_skill = read__2
  
  let write_company =
    Atdgen_codec_runtime.Encode.make (fun (t : company) ->
        Atdgen_codec_runtime.Encode.obj
          [
            Atdgen_codec_runtime.Encode.field Atdgen_codec_runtime.Encode.string
              ~name:"name" t.name;
            Atdgen_codec_runtime.Encode.field Atdgen_codec_runtime.Encode.string
              ~name:"address" t.address;
          ])
  
  let read_company =
    Atdgen_codec_runtime.Decode.make (fun json : company ->
        {
          name =
            Atdgen_codec_runtime.Decode.decode
              (Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "name")
              json;
          address =
            Atdgen_codec_runtime.Decode.decode
              (Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "address")
              json;
        })
  
  let write_employer =
    Atdgen_codec_runtime.Encode.make (fun (x : employer) ->
        match x with
        | Self -> Atdgen_codec_runtime.Encode.constr0 "Self"
        | Company x ->
          Atdgen_codec_runtime.Encode.constr1 "Company" write_company x)
  
  let read_employer =
    Atdgen_codec_runtime.Decode.enum
      [
        "Self", `Single (Self : employer);
        ( "Company",
          `Decode
            (read_company
            |> Atdgen_codec_runtime.Decode.map (fun x : employer -> Company x)) );
      ]
  
  let write__1 =
    Atdgen_codec_runtime.Encode.tuple2 Atdgen_codec_runtime.Encode.string
      write_employer
  
  let read__1 =
    Atdgen_codec_runtime.Decode.tuple2 Atdgen_codec_runtime.Decode.string
      read_employer
  
  let write_employment = write__1
  let read_employment = read__1
  let write__4 = Atdgen_codec_runtime.Encode.array write_skill
  let read__4 = Atdgen_codec_runtime.Decode.array read_skill
  let write__3 = Atdgen_codec_runtime.Encode.nullable write_employment
  let read__3 = Atdgen_codec_runtime.Decode.nullable read_employment
  
  let write_employee =
    Atdgen_codec_runtime.Encode.make (fun (t : employee) ->
        Atdgen_codec_runtime.Encode.obj
          [
            Atdgen_codec_runtime.Encode.field Atdgen_codec_runtime.Encode.string
              ~name:"name" t.name;
            Atdgen_codec_runtime.Encode.field Atdgen_codec_runtime.Encode.int
              ~name:"age" t.age;
            Atdgen_codec_runtime.Encode.field write_employment ~name:"position"
              t.position;
            Atdgen_codec_runtime.Encode.field write__3 ~name:"prev_position"
              t.prev_position;
            Atdgen_codec_runtime.Encode.field Atdgen_codec_runtime.Encode.int
              ~name:"version" t.version;
            Atdgen_codec_runtime.Encode.field write__4 ~name:"skills" t.skills;
          ])
  
  let read_employee =
    Atdgen_codec_runtime.Decode.make (fun json : employee ->
        {
          name =
            Atdgen_codec_runtime.Decode.decode
              (Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "name")
              json;
          age =
            Atdgen_codec_runtime.Decode.decode
              (Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "age")
              json;
          position =
            Atdgen_codec_runtime.Decode.decode
              (read_employment |> Atdgen_codec_runtime.Decode.field "position")
              json;
          prev_position =
            Atdgen_codec_runtime.Decode.decode
              (read__3 |> Atdgen_codec_runtime.Decode.field "prev_position")
              json;
          version =
            Atdgen_codec_runtime.Decode.decode
              (Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "version")
              json;
          skills =
            Atdgen_codec_runtime.Decode.decode
              (read__4 |> Atdgen_codec_runtime.Decode.field "skills")
              json;
        })
