open Base

let is_shout str =     
    String.exists str ~f:Char.is_alpha && String.for_all str ~f:(fun c -> not (Char.is_alpha c) || Char.is_uppercase c)

let is_question phrase =
  String.is_suffix phrase ~suffix:"?"

let response_for input =
    match String.strip input with
    | s when is_question s && is_shout s -> "Calm down, I know what I'm doing!"
    | s when is_shout s -> "Whoa, chill out!"
    | s when is_question s -> "Sure."
    | s when String.is_empty s -> "Fine. Be that way!"
    | _  -> "Whatever."
