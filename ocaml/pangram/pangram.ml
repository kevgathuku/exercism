open Base

let alphabet_set =
  Set.of_list
    (module Char)
    (List.init 26 ~f:(fun i -> Char.of_int_exn (Char.to_int 'a' + i)))

let is_pangram candidate =
  let cand_set =
    candidate |> String.lowercase |> String.to_list |> Set.of_list (module Char)
  in
  Set.is_subset alphabet_set ~of_:cand_set
