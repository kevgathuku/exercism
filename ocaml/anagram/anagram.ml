open Base

let sort_string (s : string) : string =
  s
  |> String.lowercase
  |> String.to_list
  |> List.sort ~compare:Char.compare
  |> String.of_char_list

let is_anagram ( word:string ) ( candidate:string ) =
  not String.(equal (lowercase word) (lowercase candidate)) && String.(equal (sort_string word) (sort_string candidate))

let anagrams ( target: string ) ( candidates : string list ) : string list =
  List.filter candidates ~f:(fun candidate -> is_anagram target candidate)
