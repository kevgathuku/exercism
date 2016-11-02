module Pangram exposing (isPangram)

import Regex
import Set
import String


string_to_char_set : String -> Set.Set Char
string_to_char_set input =
    input |> String.toList |> Set.fromList


alphabet =
    string_to_char_set "abcdefghijklmnopqrstuvwxyz"


strip_non_alpha =
    Regex.replace Regex.All (Regex.regex "[^a-z]") (\_ -> "")


parse_input : String -> Set.Set Char
parse_input input =
    input |> String.trim |> String.toLower |> strip_non_alpha |> string_to_char_set


isPangram : String -> Bool
isPangram input =
    alphabet == parse_input input
