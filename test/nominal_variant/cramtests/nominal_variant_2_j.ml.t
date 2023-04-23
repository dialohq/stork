  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat nominal_variant_2_j.ml | ocamlformat --enable-outside-detected-project --impl -
  (* Auto-generated from "nominal_variant_2.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type variant = Nominal_variant_2_t.variant = Field
  
  type json = Nominal_variant_2_t.json = {
    variant : variant;
    field2 : string;
    version : int;
  }
  
  let write_variant : _ -> variant -> _ =
   fun ob x -> match x with Field -> Buffer.add_string ob "\"Field\""
  
  let string_of_variant ?(len = 1024) x =
    let ob = Buffer.create len in
    write_variant ob x;
    Buffer.contents ob
  
  let read_variant p lb =
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
    | `Edgy_bracket -> (
        match Yojson.Safe.read_ident p lb with
        | "Field" ->
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_gt p lb;
            (Field : variant)
        | x -> Atdgen_runtime.Oj_run.invalid_variant_tag p x)
    | `Double_quote -> (
        match Yojson.Safe.finish_string p lb with
        | "Field" -> (Field : variant)
        | x -> Atdgen_runtime.Oj_run.invalid_variant_tag p x)
    | `Square_bracket -> (
        match Atdgen_runtime.Oj_run.read_string p lb with
        | x -> Atdgen_runtime.Oj_run.invalid_variant_tag p x)
  
  let variant_of_string s =
    read_variant (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  
  let write_json : _ -> json -> _ =
   fun ob (x : json) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then is_first := false else Buffer.add_char ob ',';
    Buffer.add_string ob "\"variant\":";
    write_variant ob x.variant;
    if !is_first then is_first := false else Buffer.add_char ob ',';
    Buffer.add_string ob "\"field2\":";
    Yojson.Safe.write_string ob x.field2;
    if !is_first then is_first := false else Buffer.add_char ob ',';
    Buffer.add_string ob "\"version\":";
    Yojson.Safe.write_int ob x.version;
    Buffer.add_char ob '}'
  
  let string_of_json ?(len = 1024) x =
    let ob = Buffer.create len in
    write_json ob x;
    Buffer.contents ob
  
  let read_json p lb =
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_variant = ref None in
    let field_field2 = ref None in
    let field_version = ref None in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f s pos len =
        if pos < 0 || len < 0 || pos + len > String.length s then
          invalid_arg
            (Printf.sprintf
               "out-of-bounds substring position or length: string = %S, \
                requested position = %i, requested length = %i"
               s pos len);
        match len with
        | 6 ->
            if
              String.unsafe_get s pos = 'f'
              && String.unsafe_get s (pos + 1) = 'i'
              && String.unsafe_get s (pos + 2) = 'e'
              && String.unsafe_get s (pos + 3) = 'l'
              && String.unsafe_get s (pos + 4) = 'd'
              && String.unsafe_get s (pos + 5) = '2'
            then 1
            else -1
        | 7 ->
            if String.unsafe_get s pos = 'v' then
              match String.unsafe_get s (pos + 1) with
              | 'a' ->
                  if
                    String.unsafe_get s (pos + 2) = 'r'
                    && String.unsafe_get s (pos + 3) = 'i'
                    && String.unsafe_get s (pos + 4) = 'a'
                    && String.unsafe_get s (pos + 5) = 'n'
                    && String.unsafe_get s (pos + 6) = 't'
                  then 0
                  else -1
              | 'e' ->
                  if
                    String.unsafe_get s (pos + 2) = 'r'
                    && String.unsafe_get s (pos + 3) = 's'
                    && String.unsafe_get s (pos + 4) = 'i'
                    && String.unsafe_get s (pos + 5) = 'o'
                    && String.unsafe_get s (pos + 6) = 'n'
                  then 2
                  else -1
              | _ -> -1
            else -1
        | _ -> -1
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (match i with
      | 0 -> field_variant := Some (read_variant p lb)
      | 1 -> field_field2 := Some (Atdgen_runtime.Oj_run.read_string p lb)
      | 2 -> field_version := Some (Atdgen_runtime.Oj_run.read_int p lb)
      | _ -> Yojson.Safe.skip_json p lb);
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f s pos len =
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg
              (Printf.sprintf
                 "out-of-bounds substring position or length: string = %S, \
                  requested position = %i, requested length = %i"
                 s pos len);
          match len with
          | 6 ->
              if
                String.unsafe_get s pos = 'f'
                && String.unsafe_get s (pos + 1) = 'i'
                && String.unsafe_get s (pos + 2) = 'e'
                && String.unsafe_get s (pos + 3) = 'l'
                && String.unsafe_get s (pos + 4) = 'd'
                && String.unsafe_get s (pos + 5) = '2'
              then 1
              else -1
          | 7 ->
              if String.unsafe_get s pos = 'v' then
                match String.unsafe_get s (pos + 1) with
                | 'a' ->
                    if
                      String.unsafe_get s (pos + 2) = 'r'
                      && String.unsafe_get s (pos + 3) = 'i'
                      && String.unsafe_get s (pos + 4) = 'a'
                      && String.unsafe_get s (pos + 5) = 'n'
                      && String.unsafe_get s (pos + 6) = 't'
                    then 0
                    else -1
                | 'e' ->
                    if
                      String.unsafe_get s (pos + 2) = 'r'
                      && String.unsafe_get s (pos + 3) = 's'
                      && String.unsafe_get s (pos + 4) = 'i'
                      && String.unsafe_get s (pos + 5) = 'o'
                      && String.unsafe_get s (pos + 6) = 'n'
                    then 2
                    else -1
                | _ -> -1
              else -1
          | _ -> -1
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        match i with
        | 0 -> field_variant := Some (read_variant p lb)
        | 1 -> field_field2 := Some (Atdgen_runtime.Oj_run.read_string p lb)
        | 2 -> field_version := Some (Atdgen_runtime.Oj_run.read_int p lb)
        | _ -> Yojson.Safe.skip_json p lb
      done;
      assert false
    with Yojson.End_of_object ->
      ({
         variant =
           (match !field_variant with
           | Some x -> x
           | None -> Atdgen_runtime.Oj_run.missing_field p "variant");
         field2 =
           (match !field_field2 with
           | Some x -> x
           | None -> Atdgen_runtime.Oj_run.missing_field p "field2");
         version =
           (match !field_version with
           | Some x -> x
           | None -> Atdgen_runtime.Oj_run.missing_field p "version");
       }
        : json)
  
  let json_of_string s =
    read_json (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
