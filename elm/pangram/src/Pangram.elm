module Pangram exposing (isPangram)

-- import Regex

import Set
import String


string_to_char_set : String -> Set.Set Char
string_to_char_set input =
    input |> String.toList |> Set.fromList


alphabet : Set.Set Char
alphabet =
    string_to_char_set "abcdefghijklmnopqrstuvwxyz"


parse_input : String -> Set.Set Char
parse_input input =
    input |> String.toLower |> string_to_char_set


isPangram : String -> Bool
isPangram input =
    Set.diff alphabet (parse_input input) == Set.empty
