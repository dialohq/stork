  $ dune exec -- stork gen *.atd
  > cat simple_transitive_change_1_t.ml
  > echo ---
  > cat simple_transitive_change_1_t.mli
  > echo ---
  > cat simple_transitive_change_1_j.ml
  > echo ---
  > cat simple_transitive_change_1_j.mli
  > echo ---
  > cat simple_transitive_change_2_t.ml
  > echo ---
  > cat simple_transitive_change_2_t.mli
  > echo ---
  > cat simple_transitive_change_2_j.ml
  > echo ---
  > cat simple_transitive_change_2_j.mli
  > echo ---
  > cat simple_transitive_change_upgrader_t.ml
  > echo ---
  > cat simple_transitive_change_upgrader_t.mli
  > echo ---
  > cat simple_transitive_change.ml
  > echo ---
  > cat simple_transitive_change.mli
  (* Auto-generated from "simple_transitive_change_1.atd" *)
                [@@@ocaml.warning "-27-32-35-39"]
  
  type 'b tuple_2 = (string * 'b)
  
  type skill = string tuple_2
  
  type company = { name: string; address: string }
  
  type employer =  Self | Company of company 
  
  type employment = employer tuple_2
  
  type employee = {
    name: string;
    age: int;
    position: employment;
    version: int;
    skills: skill Atdgen_runtime.Util.ocaml_array
  }
  ---
  (* Auto-generated from "simple_transitive_change_1.atd" *)
                [@@@ocaml.warning "-27-32-35-39"]
  
  type 'b tuple_2 = (string * 'b)
  
  type skill = string tuple_2
  
  type company = { name: string; address: string }
  
  type employer =  Self | Company of company 
  
  type employment = employer tuple_2
  
  type employee = {
    name: string;
    age: int;
    position: employment;
    version: int;
    skills: skill Atdgen_runtime.Util.ocaml_array
  }
  ---
  (* Auto-generated from "simple_transitive_change_1.atd" *)
  [@@@ocaml.warning "-27-32-35-39"]
  
  type 'b tuple_2 = 'b Simple_transitive_change_1_t.tuple_2
  
  type skill = Simple_transitive_change_1_t.skill
  
  type company = Simple_transitive_change_1_t.company = {
    name: string;
    address: string
  }
  
  type employer = Simple_transitive_change_1_t.employer = 
      Self
    | Company of company
  
  
  type employment = Simple_transitive_change_1_t.employment
  
  type employee = Simple_transitive_change_1_t.employee = {
    name: string;
    age: int;
    position: employment;
    version: int;
    skills: skill Atdgen_runtime.Util.ocaml_array
  }
  
  let write_tuple_2 write__b = (
    fun ob x ->
      Bi_outbuf.add_char ob '[';
      (let x, _ = x in
      (
        Yojson.Safe.write_string
      ) ob x
      );
      Bi_outbuf.add_char ob ',';
      (let _, x = x in
      (
        write__b
      ) ob x
      );
      Bi_outbuf.add_char ob ']';
  )
  let string_of_tuple_2 write__b ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_tuple_2 write__b ob x;
    Bi_outbuf.contents ob
  let read_tuple_2 read__b = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      let std_tuple = Yojson.Safe.start_any_tuple p lb in
      let len = ref 0 in
      let end_of_tuple = ref false in
      (try
        let x0 =
          let x =
            (
              Atdgen_runtime.Oj_run.read_string
            ) p lb
          in
          incr len;
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          x
        in
        let x1 =
          let x =
            (
              read__b
            ) p lb
          in
          incr len;
          (try
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          with Yojson.End_of_tuple -> end_of_tuple := true);
          x
        in
        if not !end_of_tuple then (
          try
            while true do
              Yojson.Safe.skip_json p lb;
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_tuple_sep2 p std_tuple lb;
            done
          with Yojson.End_of_tuple -> ()
        );
        (x0, x1)
      with Yojson.End_of_tuple ->
        Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
  )
  let tuple_2_of_string read__b s =
    read_tuple_2 read__b (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__2 = (
    fun ob x ->
      Bi_outbuf.add_char ob '[';
      (let x, _ = x in
      (
        Yojson.Safe.write_string
      ) ob x
      );
      Bi_outbuf.add_char ob ',';
      (let _, x = x in
      (
        Yojson.Safe.write_string
      ) ob x
      );
      Bi_outbuf.add_char ob ']';
  )
  let string_of__2 ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write__2 ob x;
    Bi_outbuf.contents ob
  let read__2 = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      let std_tuple = Yojson.Safe.start_any_tuple p lb in
      let len = ref 0 in
      let end_of_tuple = ref false in
      (try
        let x0 =
          let x =
            (
              Atdgen_runtime.Oj_run.read_string
            ) p lb
          in
          incr len;
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          x
        in
        let x1 =
          let x =
            (
              Atdgen_runtime.Oj_run.read_string
            ) p lb
          in
          incr len;
          (try
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          with Yojson.End_of_tuple -> end_of_tuple := true);
          x
        in
        if not !end_of_tuple then (
          try
            while true do
              Yojson.Safe.skip_json p lb;
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_tuple_sep2 p std_tuple lb;
            done
          with Yojson.End_of_tuple -> ()
        );
        (x0, x1)
      with Yojson.End_of_tuple ->
        Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
  )
  let _2_of_string s =
    read__2 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_skill = (
    write__2
  )
  let string_of_skill ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_skill ob x;
    Bi_outbuf.contents ob
  let read_skill = (
    read__2
  )
  let skill_of_string s =
    read_skill (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_company : _ -> company -> _ = (
    fun ob (x : company) ->
      Bi_outbuf.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"name\":";
      (
        Yojson.Safe.write_string
      )
        ob x.name;
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"address\":";
      (
        Yojson.Safe.write_string
      )
        ob x.address;
      Bi_outbuf.add_char ob '}';
  )
  let string_of_company ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_company ob x;
    Bi_outbuf.contents ob
  let read_company = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_name = ref (None) in
      let field_address = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'd' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 's' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_name := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_address := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              match len with
                | 4 -> (
                    if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 7 -> (
                    if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'd' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'r' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 's' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_name := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_address := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              name = (match !field_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name");
              address = (match !field_address with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "address");
            }
           : company)
        )
  )
  let company_of_string s =
    read_company (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_employer : _ -> employer -> _ = (
    fun ob x ->
      match x with
        | Self -> Bi_outbuf.add_string ob "\"Self\""
        | Company x ->
          Bi_outbuf.add_string ob "[\"Company\",";
          (
            write_company
          ) ob x;
          Bi_outbuf.add_char ob ']'
  )
  let string_of_employer ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_employer ob x;
    Bi_outbuf.contents ob
  let read_employer = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "Self" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (Self : employer)
              | "Company" ->
                Atdgen_runtime.Oj_run.read_until_field_value p lb;
                let x = (
                    read_company
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (Company x : employer)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | "Self" ->
                (Self : employer)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | "Company" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_comma p lb;
                Yojson.Safe.read_space p lb;
                let x = (
                    read_company
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_rbr p lb;
                (Company x : employer)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let employer_of_string s =
    read_employer (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__1 = (
    fun ob x ->
      Bi_outbuf.add_char ob '[';
      (let x, _ = x in
      (
        Yojson.Safe.write_string
      ) ob x
      );
      Bi_outbuf.add_char ob ',';
      (let _, x = x in
      (
        write_employer
      ) ob x
      );
      Bi_outbuf.add_char ob ']';
  )
  let string_of__1 ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write__1 ob x;
    Bi_outbuf.contents ob
  let read__1 = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      let std_tuple = Yojson.Safe.start_any_tuple p lb in
      let len = ref 0 in
      let end_of_tuple = ref false in
      (try
        let x0 =
          let x =
            (
              Atdgen_runtime.Oj_run.read_string
            ) p lb
          in
          incr len;
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          x
        in
        let x1 =
          let x =
            (
              read_employer
            ) p lb
          in
          incr len;
          (try
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          with Yojson.End_of_tuple -> end_of_tuple := true);
          x
        in
        if not !end_of_tuple then (
          try
            while true do
              Yojson.Safe.skip_json p lb;
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_tuple_sep2 p std_tuple lb;
            done
          with Yojson.End_of_tuple -> ()
        );
        (x0, x1)
      with Yojson.End_of_tuple ->
        Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
  )
  let _1_of_string s =
    read__1 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_employment = (
    write__1
  )
  let string_of_employment ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_employment ob x;
    Bi_outbuf.contents ob
  let read_employment = (
    read__1
  )
  let employment_of_string s =
    read_employment (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__3 = (
    Atdgen_runtime.Oj_run.write_array (
      write_skill
    )
  )
  let string_of__3 ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write__3 ob x;
    Bi_outbuf.contents ob
  let read__3 = (
    Atdgen_runtime.Oj_run.read_array (
      read_skill
    )
  )
  let _3_of_string s =
    read__3 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_employee : _ -> employee -> _ = (
    fun ob (x : employee) ->
      Bi_outbuf.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"name\":";
      (
        Yojson.Safe.write_string
      )
        ob x.name;
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"age\":";
      (
        Yojson.Safe.write_int
      )
        ob x.age;
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"position\":";
      (
        write_employment
      )
        ob x.position;
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"version\":";
      (
        Yojson.Safe.write_int
      )
        ob x.version;
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"skills\":";
      (
        write__3
      )
        ob x.skills;
      Bi_outbuf.add_char ob '}';
  )
  let string_of_employee ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_employee ob x;
    Bi_outbuf.contents ob
  let read_employee = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_name = ref (None) in
      let field_age = ref (None) in
      let field_position = ref (None) in
      let field_version = ref (None) in
      let field_skills = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'g' && String.unsafe_get s (pos+2) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 's' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_name := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_age := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 2 ->
              field_position := (
                Some (
                  (
                    read_employment
                  ) p lb
                )
              );
            | 3 ->
              field_version := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 4 ->
              field_skills := (
                Some (
                  (
                    read__3
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              match len with
                | 3 -> (
                    if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'g' && String.unsafe_get s (pos+2) = 'e' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 4 -> (
                    if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 6 -> (
                    if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 's' then (
                      4
                    )
                    else (
                      -1
                    )
                  )
                | 7 -> (
                    if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                      3
                    )
                    else (
                      -1
                    )
                  )
                | 8 -> (
                    if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                      2
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_name := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_age := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              | 2 ->
                field_position := (
                  Some (
                    (
                      read_employment
                    ) p lb
                  )
                );
              | 3 ->
                field_version := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              | 4 ->
                field_skills := (
                  Some (
                    (
                      read__3
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              name = (match !field_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name");
              age = (match !field_age with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "age");
              position = (match !field_position with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "position");
              version = (match !field_version with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "version");
              skills = (match !field_skills with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "skills");
            }
           : employee)
        )
  )
  let employee_of_string s =
    read_employee (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  ---
  (* Auto-generated from "simple_transitive_change_1.atd" *)
  [@@@ocaml.warning "-27-32-35-39"]
  
  type 'b tuple_2 = 'b Simple_transitive_change_1_t.tuple_2
  
  type skill = Simple_transitive_change_1_t.skill
  
  type company = Simple_transitive_change_1_t.company = {
    name: string;
    address: string
  }
  
  type employer = Simple_transitive_change_1_t.employer = 
      Self
    | Company of company
  
  
  type employment = Simple_transitive_change_1_t.employment
  
  type employee = Simple_transitive_change_1_t.employee = {
    name: string;
    age: int;
    position: employment;
    version: int;
    skills: skill Atdgen_runtime.Util.ocaml_array
  }
  
  val write_tuple_2 :
    (Bi_outbuf.t -> 'b -> unit) ->
    Bi_outbuf.t -> 'b tuple_2 -> unit
    (** Output a JSON value of type {!tuple_2}. *)
  
  val string_of_tuple_2 :
    (Bi_outbuf.t -> 'b -> unit) ->
    ?len:int -> 'b tuple_2 -> string
    (** Serialize a value of type {!tuple_2}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_tuple_2 :
    (Yojson.Safe.lexer_state -> Lexing.lexbuf -> 'b) ->
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> 'b tuple_2
    (** Input JSON data of type {!tuple_2}. *)
  
  val tuple_2_of_string :
    (Yojson.Safe.lexer_state -> Lexing.lexbuf -> 'b) ->
    string -> 'b tuple_2
    (** Deserialize JSON data of type {!tuple_2}. *)
  
  val write_skill :
    Bi_outbuf.t -> skill -> unit
    (** Output a JSON value of type {!skill}. *)
  
  val string_of_skill :
    ?len:int -> skill -> string
    (** Serialize a value of type {!skill}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_skill :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> skill
    (** Input JSON data of type {!skill}. *)
  
  val skill_of_string :
    string -> skill
    (** Deserialize JSON data of type {!skill}. *)
  
  val write_company :
    Bi_outbuf.t -> company -> unit
    (** Output a JSON value of type {!company}. *)
  
  val string_of_company :
    ?len:int -> company -> string
    (** Serialize a value of type {!company}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_company :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> company
    (** Input JSON data of type {!company}. *)
  
  val company_of_string :
    string -> company
    (** Deserialize JSON data of type {!company}. *)
  
  val write_employer :
    Bi_outbuf.t -> employer -> unit
    (** Output a JSON value of type {!employer}. *)
  
  val string_of_employer :
    ?len:int -> employer -> string
    (** Serialize a value of type {!employer}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_employer :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> employer
    (** Input JSON data of type {!employer}. *)
  
  val employer_of_string :
    string -> employer
    (** Deserialize JSON data of type {!employer}. *)
  
  val write_employment :
    Bi_outbuf.t -> employment -> unit
    (** Output a JSON value of type {!employment}. *)
  
  val string_of_employment :
    ?len:int -> employment -> string
    (** Serialize a value of type {!employment}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_employment :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> employment
    (** Input JSON data of type {!employment}. *)
  
  val employment_of_string :
    string -> employment
    (** Deserialize JSON data of type {!employment}. *)
  
  val write_employee :
    Bi_outbuf.t -> employee -> unit
    (** Output a JSON value of type {!employee}. *)
  
  val string_of_employee :
    ?len:int -> employee -> string
    (** Serialize a value of type {!employee}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_employee :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> employee
    (** Input JSON data of type {!employee}. *)
  
  val employee_of_string :
    string -> employee
    (** Deserialize JSON data of type {!employee}. *)
  
  ---
  (* Auto-generated from "simple_transitive_change_2.atd" *)
                [@@@ocaml.warning "-27-32-35-39"]
  
  type 'b tuple_2 = (string * 'b)
  
  type skill = { domain: string; name: string }
  
  type company = { name: string; turnover: int option }
  
  type employer =  Self | Company of company 
  
  type employment = employer tuple_2
  
  type employee = {
    name: string;
    age: int;
    position: employment;
    version: int;
    skills: skill Atdgen_runtime.Util.ocaml_array
  }
  ---
  (* Auto-generated from "simple_transitive_change_2.atd" *)
                [@@@ocaml.warning "-27-32-35-39"]
  
  type 'b tuple_2 = (string * 'b)
  
  type skill = { domain: string; name: string }
  
  type company = { name: string; turnover: int option }
  
  type employer =  Self | Company of company 
  
  type employment = employer tuple_2
  
  type employee = {
    name: string;
    age: int;
    position: employment;
    version: int;
    skills: skill Atdgen_runtime.Util.ocaml_array
  }
  ---
  (* Auto-generated from "simple_transitive_change_2.atd" *)
  [@@@ocaml.warning "-27-32-35-39"]
  
  type 'b tuple_2 = 'b Simple_transitive_change_2_t.tuple_2
  
  type skill = Simple_transitive_change_2_t.skill = {
    domain: string;
    name: string
  }
  
  type company = Simple_transitive_change_2_t.company = {
    name: string;
    turnover: int option
  }
  
  type employer = Simple_transitive_change_2_t.employer = 
      Self
    | Company of company
  
  
  type employment = Simple_transitive_change_2_t.employment
  
  type employee = Simple_transitive_change_2_t.employee = {
    name: string;
    age: int;
    position: employment;
    version: int;
    skills: skill Atdgen_runtime.Util.ocaml_array
  }
  
  let write_tuple_2 write__b = (
    fun ob x ->
      Bi_outbuf.add_char ob '[';
      (let x, _ = x in
      (
        Yojson.Safe.write_string
      ) ob x
      );
      Bi_outbuf.add_char ob ',';
      (let _, x = x in
      (
        write__b
      ) ob x
      );
      Bi_outbuf.add_char ob ']';
  )
  let string_of_tuple_2 write__b ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_tuple_2 write__b ob x;
    Bi_outbuf.contents ob
  let read_tuple_2 read__b = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      let std_tuple = Yojson.Safe.start_any_tuple p lb in
      let len = ref 0 in
      let end_of_tuple = ref false in
      (try
        let x0 =
          let x =
            (
              Atdgen_runtime.Oj_run.read_string
            ) p lb
          in
          incr len;
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          x
        in
        let x1 =
          let x =
            (
              read__b
            ) p lb
          in
          incr len;
          (try
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          with Yojson.End_of_tuple -> end_of_tuple := true);
          x
        in
        if not !end_of_tuple then (
          try
            while true do
              Yojson.Safe.skip_json p lb;
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_tuple_sep2 p std_tuple lb;
            done
          with Yojson.End_of_tuple -> ()
        );
        (x0, x1)
      with Yojson.End_of_tuple ->
        Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
  )
  let tuple_2_of_string read__b s =
    read_tuple_2 read__b (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_skill : _ -> skill -> _ = (
    fun ob (x : skill) ->
      Bi_outbuf.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"domain\":";
      (
        Yojson.Safe.write_string
      )
        ob x.domain;
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"name\":";
      (
        Yojson.Safe.write_string
      )
        ob x.name;
      Bi_outbuf.add_char ob '}';
  )
  let string_of_skill ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_skill ob x;
    Bi_outbuf.contents ob
  let read_skill = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_domain = ref (None) in
      let field_name = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'n' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_domain := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_name := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              match len with
                | 4 -> (
                    if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 6 -> (
                    if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'n' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_domain := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_name := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              domain = (match !field_domain with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "domain");
              name = (match !field_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name");
            }
           : skill)
        )
  )
  let skill_of_string s =
    read_skill (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__1 = (
    Atdgen_runtime.Oj_run.write_std_option (
      Yojson.Safe.write_int
    )
  )
  let string_of__1 ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write__1 ob x;
    Bi_outbuf.contents ob
  let read__1 = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "None" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (None : _ option)
              | "Some" ->
                Atdgen_runtime.Oj_run.read_until_field_value p lb;
                let x = (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (Some x : _ option)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | "None" ->
                (None : _ option)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | "Some" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_comma p lb;
                Yojson.Safe.read_space p lb;
                let x = (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_rbr p lb;
                (Some x : _ option)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let _1_of_string s =
    read__1 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_company : _ -> company -> _ = (
    fun ob (x : company) ->
      Bi_outbuf.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"name\":";
      (
        Yojson.Safe.write_string
      )
        ob x.name;
      (match x.turnover with None -> () | Some x ->
        if !is_first then
          is_first := false
        else
          Bi_outbuf.add_char ob ',';
        Bi_outbuf.add_string ob "\"turnover\":";
        (
          Yojson.Safe.write_int
        )
          ob x;
      );
      Bi_outbuf.add_char ob '}';
  )
  let string_of_company ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_company ob x;
    Bi_outbuf.contents ob
  let read_company = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_name = ref (None) in
      let field_turnover = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'v' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'r' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_name := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              if not (Yojson.Safe.read_null_if_possible p lb) then (
                field_turnover := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              )
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              match len with
                | 4 -> (
                    if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 8 -> (
                    if String.unsafe_get s pos = 't' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'v' && String.unsafe_get s (pos+6) = 'e' && String.unsafe_get s (pos+7) = 'r' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_name := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                if not (Yojson.Safe.read_null_if_possible p lb) then (
                  field_turnover := (
                    Some (
                      (
                        Atdgen_runtime.Oj_run.read_int
                      ) p lb
                    )
                  );
                )
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              name = (match !field_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name");
              turnover = !field_turnover;
            }
           : company)
        )
  )
  let company_of_string s =
    read_company (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_employer : _ -> employer -> _ = (
    fun ob x ->
      match x with
        | Self -> Bi_outbuf.add_string ob "\"Self\""
        | Company x ->
          Bi_outbuf.add_string ob "[\"Company\",";
          (
            write_company
          ) ob x;
          Bi_outbuf.add_char ob ']'
  )
  let string_of_employer ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_employer ob x;
    Bi_outbuf.contents ob
  let read_employer = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      match Yojson.Safe.start_any_variant p lb with
        | `Edgy_bracket -> (
            match Yojson.Safe.read_ident p lb with
              | "Self" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (Self : employer)
              | "Company" ->
                Atdgen_runtime.Oj_run.read_until_field_value p lb;
                let x = (
                    read_company
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_gt p lb;
                (Company x : employer)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Double_quote -> (
            match Yojson.Safe.finish_string p lb with
              | "Self" ->
                (Self : employer)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
        | `Square_bracket -> (
            match Atdgen_runtime.Oj_run.read_string p lb with
              | "Company" ->
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_comma p lb;
                Yojson.Safe.read_space p lb;
                let x = (
                    read_company
                  ) p lb
                in
                Yojson.Safe.read_space p lb;
                Yojson.Safe.read_rbr p lb;
                (Company x : employer)
              | x ->
                Atdgen_runtime.Oj_run.invalid_variant_tag p x
          )
  )
  let employer_of_string s =
    read_employer (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__2 = (
    fun ob x ->
      Bi_outbuf.add_char ob '[';
      (let x, _ = x in
      (
        Yojson.Safe.write_string
      ) ob x
      );
      Bi_outbuf.add_char ob ',';
      (let _, x = x in
      (
        write_employer
      ) ob x
      );
      Bi_outbuf.add_char ob ']';
  )
  let string_of__2 ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write__2 ob x;
    Bi_outbuf.contents ob
  let read__2 = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      let std_tuple = Yojson.Safe.start_any_tuple p lb in
      let len = ref 0 in
      let end_of_tuple = ref false in
      (try
        let x0 =
          let x =
            (
              Atdgen_runtime.Oj_run.read_string
            ) p lb
          in
          incr len;
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          x
        in
        let x1 =
          let x =
            (
              read_employer
            ) p lb
          in
          incr len;
          (try
            Yojson.Safe.read_space p lb;
            Yojson.Safe.read_tuple_sep2 p std_tuple lb;
          with Yojson.End_of_tuple -> end_of_tuple := true);
          x
        in
        if not !end_of_tuple then (
          try
            while true do
              Yojson.Safe.skip_json p lb;
              Yojson.Safe.read_space p lb;
              Yojson.Safe.read_tuple_sep2 p std_tuple lb;
            done
          with Yojson.End_of_tuple -> ()
        );
        (x0, x1)
      with Yojson.End_of_tuple ->
        Atdgen_runtime.Oj_run.missing_tuple_fields p !len [ 0; 1 ]);
  )
  let _2_of_string s =
    read__2 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_employment = (
    write__2
  )
  let string_of_employment ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_employment ob x;
    Bi_outbuf.contents ob
  let read_employment = (
    read__2
  )
  let employment_of_string s =
    read_employment (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write__3 = (
    Atdgen_runtime.Oj_run.write_array (
      write_skill
    )
  )
  let string_of__3 ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write__3 ob x;
    Bi_outbuf.contents ob
  let read__3 = (
    Atdgen_runtime.Oj_run.read_array (
      read_skill
    )
  )
  let _3_of_string s =
    read__3 (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  let write_employee : _ -> employee -> _ = (
    fun ob (x : employee) ->
      Bi_outbuf.add_char ob '{';
      let is_first = ref true in
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"name\":";
      (
        Yojson.Safe.write_string
      )
        ob x.name;
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"age\":";
      (
        Yojson.Safe.write_int
      )
        ob x.age;
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"position\":";
      (
        write_employment
      )
        ob x.position;
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"version\":";
      (
        Yojson.Safe.write_int
      )
        ob x.version;
      if !is_first then
        is_first := false
      else
        Bi_outbuf.add_char ob ',';
      Bi_outbuf.add_string ob "\"skills\":";
      (
        write__3
      )
        ob x.skills;
      Bi_outbuf.add_char ob '}';
  )
  let string_of_employee ?(len = 1024) x =
    let ob = Bi_outbuf.create len in
    write_employee ob x;
    Bi_outbuf.contents ob
  let read_employee = (
    fun p lb ->
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_lcurl p lb;
      let field_name = ref (None) in
      let field_age = ref (None) in
      let field_position = ref (None) in
      let field_version = ref (None) in
      let field_skills = ref (None) in
      try
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_end lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 3 -> (
                  if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'g' && String.unsafe_get s (pos+2) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 's' then (
                    4
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 8 -> (
                  if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Atdgen_runtime.Oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              field_name := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_string
                  ) p lb
                )
              );
            | 1 ->
              field_age := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 2 ->
              field_position := (
                Some (
                  (
                    read_employment
                  ) p lb
                )
              );
            | 3 ->
              field_version := (
                Some (
                  (
                    Atdgen_runtime.Oj_run.read_int
                  ) p lb
                )
              );
            | 4 ->
              field_skills := (
                Some (
                  (
                    read__3
                  ) p lb
                )
              );
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
        while true do
          Yojson.Safe.read_space p lb;
          Yojson.Safe.read_object_sep p lb;
          Yojson.Safe.read_space p lb;
          let f =
            fun s pos len ->
              if pos < 0 || len < 0 || pos + len > String.length s then
                invalid_arg "out-of-bounds substring position or length";
              match len with
                | 3 -> (
                    if String.unsafe_get s pos = 'a' && String.unsafe_get s (pos+1) = 'g' && String.unsafe_get s (pos+2) = 'e' then (
                      1
                    )
                    else (
                      -1
                    )
                  )
                | 4 -> (
                    if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                      0
                    )
                    else (
                      -1
                    )
                  )
                | 6 -> (
                    if String.unsafe_get s pos = 's' && String.unsafe_get s (pos+1) = 'k' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'l' && String.unsafe_get s (pos+4) = 'l' && String.unsafe_get s (pos+5) = 's' then (
                      4
                    )
                    else (
                      -1
                    )
                  )
                | 7 -> (
                    if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                      3
                    )
                    else (
                      -1
                    )
                  )
                | 8 -> (
                    if String.unsafe_get s pos = 'p' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'i' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'i' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'n' then (
                      2
                    )
                    else (
                      -1
                    )
                  )
                | _ -> (
                    -1
                  )
          in
          let i = Yojson.Safe.map_ident p f lb in
          Atdgen_runtime.Oj_run.read_until_field_value p lb;
          (
            match i with
              | 0 ->
                field_name := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_string
                    ) p lb
                  )
                );
              | 1 ->
                field_age := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              | 2 ->
                field_position := (
                  Some (
                    (
                      read_employment
                    ) p lb
                  )
                );
              | 3 ->
                field_version := (
                  Some (
                    (
                      Atdgen_runtime.Oj_run.read_int
                    ) p lb
                  )
                );
              | 4 ->
                field_skills := (
                  Some (
                    (
                      read__3
                    ) p lb
                  )
                );
              | _ -> (
                  Yojson.Safe.skip_json p lb
                )
          );
        done;
        assert false;
      with Yojson.End_of_object -> (
          (
            {
              name = (match !field_name with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "name");
              age = (match !field_age with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "age");
              position = (match !field_position with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "position");
              version = (match !field_version with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "version");
              skills = (match !field_skills with Some x -> x | None -> Atdgen_runtime.Oj_run.missing_field p "skills");
            }
           : employee)
        )
  )
  let employee_of_string s =
    read_employee (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
  ---
  (* Auto-generated from "simple_transitive_change_2.atd" *)
  [@@@ocaml.warning "-27-32-35-39"]
  
  type 'b tuple_2 = 'b Simple_transitive_change_2_t.tuple_2
  
  type skill = Simple_transitive_change_2_t.skill = {
    domain: string;
    name: string
  }
  
  type company = Simple_transitive_change_2_t.company = {
    name: string;
    turnover: int option
  }
  
  type employer = Simple_transitive_change_2_t.employer = 
      Self
    | Company of company
  
  
  type employment = Simple_transitive_change_2_t.employment
  
  type employee = Simple_transitive_change_2_t.employee = {
    name: string;
    age: int;
    position: employment;
    version: int;
    skills: skill Atdgen_runtime.Util.ocaml_array
  }
  
  val write_tuple_2 :
    (Bi_outbuf.t -> 'b -> unit) ->
    Bi_outbuf.t -> 'b tuple_2 -> unit
    (** Output a JSON value of type {!tuple_2}. *)
  
  val string_of_tuple_2 :
    (Bi_outbuf.t -> 'b -> unit) ->
    ?len:int -> 'b tuple_2 -> string
    (** Serialize a value of type {!tuple_2}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_tuple_2 :
    (Yojson.Safe.lexer_state -> Lexing.lexbuf -> 'b) ->
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> 'b tuple_2
    (** Input JSON data of type {!tuple_2}. *)
  
  val tuple_2_of_string :
    (Yojson.Safe.lexer_state -> Lexing.lexbuf -> 'b) ->
    string -> 'b tuple_2
    (** Deserialize JSON data of type {!tuple_2}. *)
  
  val write_skill :
    Bi_outbuf.t -> skill -> unit
    (** Output a JSON value of type {!skill}. *)
  
  val string_of_skill :
    ?len:int -> skill -> string
    (** Serialize a value of type {!skill}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_skill :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> skill
    (** Input JSON data of type {!skill}. *)
  
  val skill_of_string :
    string -> skill
    (** Deserialize JSON data of type {!skill}. *)
  
  val write_company :
    Bi_outbuf.t -> company -> unit
    (** Output a JSON value of type {!company}. *)
  
  val string_of_company :
    ?len:int -> company -> string
    (** Serialize a value of type {!company}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_company :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> company
    (** Input JSON data of type {!company}. *)
  
  val company_of_string :
    string -> company
    (** Deserialize JSON data of type {!company}. *)
  
  val write_employer :
    Bi_outbuf.t -> employer -> unit
    (** Output a JSON value of type {!employer}. *)
  
  val string_of_employer :
    ?len:int -> employer -> string
    (** Serialize a value of type {!employer}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_employer :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> employer
    (** Input JSON data of type {!employer}. *)
  
  val employer_of_string :
    string -> employer
    (** Deserialize JSON data of type {!employer}. *)
  
  val write_employment :
    Bi_outbuf.t -> employment -> unit
    (** Output a JSON value of type {!employment}. *)
  
  val string_of_employment :
    ?len:int -> employment -> string
    (** Serialize a value of type {!employment}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_employment :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> employment
    (** Input JSON data of type {!employment}. *)
  
  val employment_of_string :
    string -> employment
    (** Deserialize JSON data of type {!employment}. *)
  
  val write_employee :
    Bi_outbuf.t -> employee -> unit
    (** Output a JSON value of type {!employee}. *)
  
  val string_of_employee :
    ?len:int -> employee -> string
    (** Serialize a value of type {!employee}
        into a JSON string.
        @param len specifies the initial length
                   of the buffer used internally.
                   Default: 1024. *)
  
  val read_employee :
    Yojson.Safe.lexer_state -> Lexing.lexbuf -> employee
    (** Input JSON data of type {!employee}. *)
  
  val employee_of_string :
    string -> employee
    (** Deserialize JSON data of type {!employee}. *)
  
  ---
  module From_1_to_2 = struct
  module OldVersion = Simple_transitive_change_1_t
  module NewVersion = Simple_transitive_change_2_t
  type converter = { convert_employee: converter -> OldVersion.employee -> NewVersion.employee;
  convert_employment: converter -> OldVersion.employee -> OldVersion.employment -> NewVersion.employment;
  convert_employer: converter -> OldVersion.employee -> OldVersion.employer -> NewVersion.employer;
  convert_company: converter -> OldVersion.employee -> OldVersion.company -> NewVersion.company;
  convert_skill: converter -> OldVersion.employee -> OldVersion.skill -> NewVersion.skill }
  end
  ---
  module From_1_to_2 : sig
  module OldVersion : (module type of Simple_transitive_change_1_t)
  module NewVersion : (module type of Simple_transitive_change_2_t)
  type converter = { convert_employee: converter -> OldVersion.employee -> NewVersion.employee;
  convert_employment: converter -> OldVersion.employee -> OldVersion.employment -> NewVersion.employment;
  convert_employer: converter -> OldVersion.employee -> OldVersion.employer -> NewVersion.employer;
  convert_company: converter -> OldVersion.employee -> OldVersion.company -> NewVersion.company;
  convert_skill: converter -> OldVersion.employee -> OldVersion.skill -> NewVersion.skill }
  end
  ---
  [@@@ocaml.warning "-32-33-44"]
  open StdLabels
  module Types = Simple_transitive_change_2_t
  module Json = Simple_transitive_change_2_j
  module From_1_to_2 = struct
  
  include Simple_transitive_change_user_fns.From_1_to_2
  
  let convert_employer: converter -> OldVersion.employee -> OldVersion.employer -> NewVersion.employer = fun converter old_doc -> function 
  | OldVersion.Self -> NewVersion.Self
  | OldVersion.Company payload -> NewVersion.Company (payload |> (convert_company converter old_doc))
  let convert_employment: converter -> OldVersion.employee -> OldVersion.employment -> NewVersion.employment = fun converter old_doc -> fun (a_0, a_1) -> (a_0, a_1 |> (convert_employer converter old_doc))
  let convert_employee: converter -> OldVersion.employee -> NewVersion.employee = fun converter old_doc -> old_doc |> (fun old_record -> NewVersion.{ name = old_record.name;
  age = old_record.age;
  position = old_record.position |> (convert_employment converter old_doc);
  version = 2;
  skills = old_record.skills |> (Array.map ~f:(convert_skill converter old_doc)); })
  let converter = Simple_transitive_change_upgrader_t.From_1_to_2.{ convert_employee;
  convert_employment;
  convert_employer;
  convert_company;
  convert_skill }
  let convert = convert_employee converter
  end
  let convert_from_1_to_latest = From_1_to_2.convert
  let version_to_string = function `Int v -> string_of_int v | `String s -> s
  
  let get_version_from_json = function
    | `Assoc fields ->
      let version =
        List.find_map
          ~f:(function
            | "version", ((`String _ | `Int _) as version) ->
              Some version
            | _ ->
              None)
          fields
      in
      (match version with
      | None ->
        invalid_arg
          "The parsed JSON should have a `version` field of type int or string"
      | Some version ->
        version)
    | _ ->
      invalid_arg "The parsed JSON should be an object."
  
  let get_version s =
    get_version_from_json (Yojson.Safe.from_string s)
  let get_version_from_file fname =
    get_version_from_json (Yojson.Safe.from_file ~fname fname)
  let string_of_employee ?len x = Json.string_of_employee ?len { x with Types.version = 2 }
  
  let employee_of_string s = match (get_version s) with
    | `Int 2 -> Json.employee_of_string s
    | `Int 1 -> convert_from_1_to_latest (Simple_transitive_change_1_j.employee_of_string s)
    | v -> invalid_arg ("Unknown document version: '" ^ version_to_string v ^ "'")
  
  
  let read_employee_from_file fname = match (get_version_from_file fname) with
    | `Int 2 -> Atdgen_runtime.Util.Json.from_file Json.read_employee fname
    | `Int 1 -> convert_from_1_to_latest (Atdgen_runtime.Util.Json.from_file Simple_transitive_change_1_j.read_employee fname)
    | v -> invalid_arg ("Unknown document version: '" ^ version_to_string v ^ "'")
  
  let write_employee buf x = Json.write_employee buf { x with Types.version = 2 }
  ---
  module Types: module type of Simple_transitive_change_2_t
  module Json: module type of Simple_transitive_change_2_j
  val employee_of_string: string -> Types.employee
  val string_of_employee: ?len:int -> Types.employee -> string
  val read_employee_from_file: string -> Types.employee
  val write_employee: Bi_outbuf.t -> Types.employee -> unit
  module From_1_to_2 : sig
  module OldVersion : (module type of Simple_transitive_change_1_t)
  module NewVersion : (module type of Simple_transitive_change_2_t)
  type converter = Simple_transitive_change_upgrader_t.From_1_to_2.converter
  val converter: converter
  val convert: OldVersion.employee -> NewVersion.employee
  end
