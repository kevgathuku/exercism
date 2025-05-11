open Base

module CharSet = Set.M(Char)

let is_isogram (word: string) : bool =
    if String.length word = 0 then true
    else
    let cleaned_word = word |> String.lowercase |> String.filter ~f:Char.is_alpha in
    let chars_in_string (s : string) : CharSet.t =
      String.fold s ~init:(Set.empty (module Char)) ~f:(fun acc ch -> Set.add acc ch)
    in
    String.length cleaned_word = Set.length (chars_in_string cleaned_word)
