open Core.Std
open Str

let is_upper str =
    (* The string should contain at least one uppercase character *)
    String.equal str (String.uppercase str) && Str.string_match (Str.regexp ".*[A-Z]+") str 0
;;

(* Main function that will be exported *)
let response_for input =
    let stripped_input = (String.strip input) in
    if String.is_suffix stripped_input ~suffix:"?" = true && not (is_upper stripped_input) then "Sure."
    else if String.is_empty stripped_input = true then "Fine. Be that way!"
    else if is_upper stripped_input then "Whoa, chill out!"
    else "Whatever."
;;

(* empty string -> Fine. Be that way! *)
(* question ->  Sure. *)
(* all caps -> Whoa, chill out!  *)
(* question, ALL CAPS ->  Whoa, chill out! *)
(* anything else -> Whatever. *)
