  $ cd ..
  $ dune exec -- stork gen *.atd
  $ cat single_version_1_j.ml | ocamlformat --enable-outside-detected-project --impl -
  (* Auto-generated from "single_version_1.atd" *)
  [@@@ocaml.warning "-27-32-33-35-39"]
  
  type 'b tuple_2 = 'b Single_version_1_t.tuple_2
  type skill = Single_version_1_t.skill
  type company = Single_version_1_t.company = { name : string; address : string }
  type employer = Single_version_1_t.employer
  type employment = Single_version_1_t.employment
  
  type employee = Single_version_1_t.employee = {
    name : string;
    age : int;
    position : employment;
    version : int;
    skills : skill list;
  }
  
  let write_tuple_2 write__b ob x =
    Buffer.add_char ob '[';
    (let x, _ = x in
     Yojson.Safe.write_string ob x);
    Buffer.add_char ob ',';
    (let _, x = x in
     write__b ob x);
    Buffer.add_char ob ']'
  
  let string_of_tuple_2 write__b ?(len = 1024) x =
    let ob = Buffer.create len in
    write_tuple_2 write__b ob x;
    Buffer.contents ob
  
  let read_tuple_2 read__b p lb =
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    try
      let x0 =
        let x = Atdgen_runtime.Oj_run.read_string p lb in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x = read__b p lb in
        incr len;
        (try
           Yojson.Safe.read_space p lb;
           Yojson.Safe.read_tuple_sep2 p std_tuple lb
         with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      (if not !end_of_tuple then
         try
           while true do
             Yojson.Safe.skip_json p lb;
             Yojson.Safe.read_space p lb;
             Yojson.Safe.read_tuple_sep2 p std_tuple lb
           done
         with Yojson.End_of_tuple -> ());
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]
  
  let tuple_2_of_string read__b s =
    read_tuple_2 read__b (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  
  let write__string_tuple_2 ob x =
    Buffer.add_char ob '[';
    (let x, _ = x in
     Yojson.Safe.write_string ob x);
    Buffer.add_char ob ',';
    (let _, x = x in
     Yojson.Safe.write_string ob x);
    Buffer.add_char ob ']'
  
  let string_of__string_tuple_2 ?(len = 1024) x =
    let ob = Buffer.create len in
    write__string_tuple_2 ob x;
    Buffer.contents ob
  
  let read__string_tuple_2 p lb =
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    try
      let x0 =
        let x = Atdgen_runtime.Oj_run.read_string p lb in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x = Atdgen_runtime.Oj_run.read_string p lb in
        incr len;
        (try
           Yojson.Safe.read_space p lb;
           Yojson.Safe.read_tuple_sep2 p std_tuple lb
         with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      (if not !end_of_tuple then
         try
           while true do
             Yojson.Safe.skip_json p lb;
             Yojson.Safe.read_space p lb;
             Yojson.Safe.read_tuple_sep2 p std_tuple lb
           done
         with Yojson.End_of_tuple -> ());
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]
  
  let _string_tuple_2_of_string s =
    read__string_tuple_2 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  
  let write_skill = write__string_tuple_2
  
  let string_of_skill ?(len = 1024) x =
    let ob = Buffer.create len in
    write_skill ob x;
    Buffer.contents ob
  
  let read_skill = read__string_tuple_2
  
  let skill_of_string s =
    read_skill (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  
  let write_company : _ -> company -> _ =
   fun ob (x : company) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then is_first := false else Buffer.add_char ob ',';
    Buffer.add_string ob "\"name\":";
    Yojson.Safe.write_string ob x.name;
    if !is_first then is_first := false else Buffer.add_char ob ',';
    Buffer.add_string ob "\"address\":";
    Yojson.Safe.write_string ob x.address;
    Buffer.add_char ob '}'
  
  let string_of_company ?(len = 1024) x =
    let ob = Buffer.create len in
    write_company ob x;
    Buffer.contents ob
  
  let read_company p lb =
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_name = ref None in
    let field_address = ref None in
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
        | 4 ->
            if
              String.unsafe_get s pos = 'n'
              && String.unsafe_get s (pos + 1) = 'a'
              && String.unsafe_get s (pos + 2) = 'm'
              && String.unsafe_get s (pos + 3) = 'e'
            then 0
            else -1
        | 7 ->
            if
              String.unsafe_get s pos = 'a'
              && String.unsafe_get s (pos + 1) = 'd'
              && String.unsafe_get s (pos + 2) = 'd'
              && String.unsafe_get s (pos + 3) = 'r'
              && String.unsafe_get s (pos + 4) = 'e'
              && String.unsafe_get s (pos + 5) = 's'
              && String.unsafe_get s (pos + 6) = 's'
            then 1
            else -1
        | _ -> -1
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (match i with
      | 0 -> field_name := Some (Atdgen_runtime.Oj_run.read_string p lb)
      | 1 -> field_address := Some (Atdgen_runtime.Oj_run.read_string p lb)
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
          | 4 ->
              if
                String.unsafe_get s pos = 'n'
                && String.unsafe_get s (pos + 1) = 'a'
                && String.unsafe_get s (pos + 2) = 'm'
                && String.unsafe_get s (pos + 3) = 'e'
              then 0
              else -1
          | 7 ->
              if
                String.unsafe_get s pos = 'a'
                && String.unsafe_get s (pos + 1) = 'd'
                && String.unsafe_get s (pos + 2) = 'd'
                && String.unsafe_get s (pos + 3) = 'r'
                && String.unsafe_get s (pos + 4) = 'e'
                && String.unsafe_get s (pos + 5) = 's'
                && String.unsafe_get s (pos + 6) = 's'
              then 1
              else -1
          | _ -> -1
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        match i with
        | 0 -> field_name := Some (Atdgen_runtime.Oj_run.read_string p lb)
        | 1 -> field_address := Some (Atdgen_runtime.Oj_run.read_string p lb)
        | _ -> Yojson.Safe.skip_json p lb
      done;
      assert false
    with Yojson.End_of_object ->
      ({
         name =
           (match !field_name with
           | Some x -> x
           | None -> Atdgen_runtime.Oj_run.missing_field p "name");
         address =
           (match !field_address with
           | Some x -> x
           | None -> Atdgen_runtime.Oj_run.missing_field p "address");
       }
        : company)
  
  let company_of_string s =
    read_company (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  
  let write_employer ob x =
    match x with
    | `Self -> Buffer.add_string ob "\"Self\""
    | `Company x ->
        Buffer.add_string ob "[\"Company\",";
        write_company ob x;
        Buffer.add_char ob ']'
  
  let string_of_employer ?(len = 1024) x =
    let ob = Buffer.create len in
    write_employer ob x;
    Buffer.contents ob
  
  let read_employer p lb =
    Yojson.Safe.read_space p lb;
    match Yojson.Safe.start_any_variant p lb with
    | `Edgy_bracket -> (
        match Yojson.Safe.read_ident p lb with
        | "Self" ->
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_gt p lb;
            `Self
        | "Company" ->
            Atdgen_runtime.Oj_run.read_until_field_value p lb;
            let x = read_company p lb in
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_gt p lb;
            `Company x
        | x -> Atdgen_runtime.Oj_run.invalid_variant_tag p x)
    | `Double_quote -> (
        match Yojson.Safe.finish_string p lb with
        | "Self" -> `Self
        | x -> Atdgen_runtime.Oj_run.invalid_variant_tag p x)
    | `Square_bracket -> (
        match Atdgen_runtime.Oj_run.read_string p lb with
        | "Company" ->
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_comma p lb;
            Yojson.Safe.read_space p lb;
            let x = read_company p lb in
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_rbr p lb;
            `Company x
        | x -> Atdgen_runtime.Oj_run.invalid_variant_tag p x)
  
  let employer_of_string s =
    read_employer (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  
  let write__employer_tuple_2 ob x =
    Buffer.add_char ob '[';
    (let x, _ = x in
     Yojson.Safe.write_string ob x);
    Buffer.add_char ob ',';
    (let _, x = x in
     write_employer ob x);
    Buffer.add_char ob ']'
  
  let string_of__employer_tuple_2 ?(len = 1024) x =
    let ob = Buffer.create len in
    write__employer_tuple_2 ob x;
    Buffer.contents ob
  
  let read__employer_tuple_2 p lb =
    Yojson.Safe.read_space p lb;
    let std_tuple = Yojson.Safe.start_any_tuple p lb in
    let len = ref 0 in
    let end_of_tuple = ref false in
    try
      let x0 =
        let x = Atdgen_runtime.Oj_run.read_string p lb in
        incr len;
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_tuple_sep2 p std_tuple lb;
        x
      in
      let x1 =
        let x = read_employer p lb in
        incr len;
        (try
           Yojson.Safe.read_space p lb;
           Yojson.Safe.read_tuple_sep2 p std_tuple lb
         with Yojson.End_of_tuple -> end_of_tuple := true);
        x
      in
      (if not !end_of_tuple then
         try
           while true do
             Yojson.Safe.skip_json p lb;
             Yojson.Safe.read_space p lb;
             Yojson.Safe.read_tuple_sep2 p std_tuple lb
           done
         with Yojson.End_of_tuple -> ());
      (x0, x1)
    with Yojson.End_of_tuple ->
      Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]
  
  let _employer_tuple_2_of_string s =
    read__employer_tuple_2 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  
  let write_employment = write__employer_tuple_2
  
  let string_of_employment ?(len = 1024) x =
    let ob = Buffer.create len in
    write_employment ob x;
    Buffer.contents ob
  
  let read_employment = read__employer_tuple_2
  
  let employment_of_string s =
    read_employment (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  
  let write__skill_list = Atdgen_runtime.Oj_run.write_list write_skill
  
  let string_of__skill_list ?(len = 1024) x =
    let ob = Buffer.create len in
    write__skill_list ob x;
    Buffer.contents ob
  
  let read__skill_list = Atdgen_runtime.Oj_run.read_list read_skill
  
  let _skill_list_of_string s =
    read__skill_list (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  
  let write_employee : _ -> employee -> _ =
   fun ob (x : employee) ->
    Buffer.add_char ob '{';
    let is_first = ref true in
    if !is_first then is_first := false else Buffer.add_char ob ',';
    Buffer.add_string ob "\"name\":";
    Yojson.Safe.write_string ob x.name;
    if !is_first then is_first := false else Buffer.add_char ob ',';
    Buffer.add_string ob "\"age\":";
    Yojson.Safe.write_int ob x.age;
    if !is_first then is_first := false else Buffer.add_char ob ',';
    Buffer.add_string ob "\"position\":";
    write_employment ob x.position;
    if !is_first then is_first := false else Buffer.add_char ob ',';
    Buffer.add_string ob "\"version\":";
    Yojson.Safe.write_int ob x.version;
    if !is_first then is_first := false else Buffer.add_char ob ',';
    Buffer.add_string ob "\"skills\":";
    write__skill_list ob x.skills;
    Buffer.add_char ob '}'
  
  let string_of_employee ?(len = 1024) x =
    let ob = Buffer.create len in
    write_employee ob x;
    Buffer.contents ob
  
  let read_employee p lb =
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let field_name = ref None in
    let field_age = ref None in
    let field_position = ref None in
    let field_version = ref None in
    let field_skills = ref None in
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
        | 3 ->
            if
              String.unsafe_get s pos = 'a'
              && String.unsafe_get s (pos + 1) = 'g'
              && String.unsafe_get s (pos + 2) = 'e'
            then 1
            else -1
        | 4 ->
            if
              String.unsafe_get s pos = 'n'
              && String.unsafe_get s (pos + 1) = 'a'
              && String.unsafe_get s (pos + 2) = 'm'
              && String.unsafe_get s (pos + 3) = 'e'
            then 0
            else -1
        | 6 ->
            if
              String.unsafe_get s pos = 's'
              && String.unsafe_get s (pos + 1) = 'k'
              && String.unsafe_get s (pos + 2) = 'i'
              && String.unsafe_get s (pos + 3) = 'l'
              && String.unsafe_get s (pos + 4) = 'l'
              && String.unsafe_get s (pos + 5) = 's'
            then 4
            else -1
        | 7 ->
            if
              String.unsafe_get s pos = 'v'
              && String.unsafe_get s (pos + 1) = 'e'
              && String.unsafe_get s (pos + 2) = 'r'
              && String.unsafe_get s (pos + 3) = 's'
              && String.unsafe_get s (pos + 4) = 'i'
              && String.unsafe_get s (pos + 5) = 'o'
              && String.unsafe_get s (pos + 6) = 'n'
            then 3
            else -1
        | 8 ->
            if
              String.unsafe_get s pos = 'p'
              && String.unsafe_get s (pos + 1) = 'o'
              && String.unsafe_get s (pos + 2) = 's'
              && String.unsafe_get s (pos + 3) = 'i'
              && String.unsafe_get s (pos + 4) = 't'
              && String.unsafe_get s (pos + 5) = 'i'
              && String.unsafe_get s (pos + 6) = 'o'
              && String.unsafe_get s (pos + 7) = 'n'
            then 2
            else -1
        | _ -> -1
      in
      let i = Yojson.Safe.map_ident p f lb in
      Atdgen_runtime.Oj_run.read_until_field_value p lb;
      (match i with
      | 0 -> field_name := Some (Atdgen_runtime.Oj_run.read_string p lb)
      | 1 -> field_age := Some (Atdgen_runtime.Oj_run.read_int p lb)
      | 2 -> field_position := Some (read_employment p lb)
      | 3 -> field_version := Some (Atdgen_runtime.Oj_run.read_int p lb)
      | 4 -> field_skills := Some (read__skill_list p lb)
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
          | 3 ->
              if
                String.unsafe_get s pos = 'a'
                && String.unsafe_get s (pos + 1) = 'g'
                && String.unsafe_get s (pos + 2) = 'e'
              then 1
              else -1
          | 4 ->
              if
                String.unsafe_get s pos = 'n'
                && String.unsafe_get s (pos + 1) = 'a'
                && String.unsafe_get s (pos + 2) = 'm'
                && String.unsafe_get s (pos + 3) = 'e'
              then 0
              else -1
          | 6 ->
              if
                String.unsafe_get s pos = 's'
                && String.unsafe_get s (pos + 1) = 'k'
                && String.unsafe_get s (pos + 2) = 'i'
                && String.unsafe_get s (pos + 3) = 'l'
                && String.unsafe_get s (pos + 4) = 'l'
                && String.unsafe_get s (pos + 5) = 's'
              then 4
              else -1
          | 7 ->
              if
                String.unsafe_get s pos = 'v'
                && String.unsafe_get s (pos + 1) = 'e'
                && String.unsafe_get s (pos + 2) = 'r'
                && String.unsafe_get s (pos + 3) = 's'
                && String.unsafe_get s (pos + 4) = 'i'
                && String.unsafe_get s (pos + 5) = 'o'
                && String.unsafe_get s (pos + 6) = 'n'
              then 3
              else -1
          | 8 ->
              if
                String.unsafe_get s pos = 'p'
                && String.unsafe_get s (pos + 1) = 'o'
                && String.unsafe_get s (pos + 2) = 's'
                && String.unsafe_get s (pos + 3) = 'i'
                && String.unsafe_get s (pos + 4) = 't'
                && String.unsafe_get s (pos + 5) = 'i'
                && String.unsafe_get s (pos + 6) = 'o'
                && String.unsafe_get s (pos + 7) = 'n'
              then 2
              else -1
          | _ -> -1
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        match i with
        | 0 -> field_name := Some (Atdgen_runtime.Oj_run.read_string p lb)
        | 1 -> field_age := Some (Atdgen_runtime.Oj_run.read_int p lb)
        | 2 -> field_position := Some (read_employment p lb)
        | 3 -> field_version := Some (Atdgen_runtime.Oj_run.read_int p lb)
        | 4 -> field_skills := Some (read__skill_list p lb)
        | _ -> Yojson.Safe.skip_json p lb
      done;
      assert false
    with Yojson.End_of_object ->
      ({
         name =
           (match !field_name with
           | Some x -> x
           | None -> Atdgen_runtime.Oj_run.missing_field p "name");
         age =
           (match !field_age with
           | Some x -> x
           | None -> Atdgen_runtime.Oj_run.missing_field p "age");
         position =
           (match !field_position with
           | Some x -> x
           | None -> Atdgen_runtime.Oj_run.missing_field p "position");
         version =
           (match !field_version with
           | Some x -> x
           | None -> Atdgen_runtime.Oj_run.missing_field p "version");
         skills =
           (match !field_skills with
           | Some x -> x
           | None -> Atdgen_runtime.Oj_run.missing_field p "skills");
       }
        : employee)
  
  let employee_of_string s =
    read_employee (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
