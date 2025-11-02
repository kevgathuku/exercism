open Base

let char_set_of_list chars = Set.of_list (module Char) chars

let alphabet_set =
  char_set_of_list
    (List.init 26 ~f:(fun i -> Char.of_int_exn (Char.to_int 'a' + i)))

let is_pangram candidate =
  let candidate_set =
    candidate |> String.lowercase |> String.to_list |> char_set_of_list
  in
  Set.is_subset alphabet_set ~of_:candidate_set
