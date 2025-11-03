open Base

let contains_alpha (s : string) : bool = String.exists s ~f:Char.is_alpha

let is_punctuation (c: char) : bool =
  Char.equal c '@' || Char.equal c ':' || Char.equal c '!'

let contains_punctuation (s: string): bool =
  String.exists s ~f:is_punctuation

let check_valid_first_digits (s: string) =
  if Char.equal s.[0] '0' then
    Error "area code cannot start with zero"
  else if Char.equal s.[0] '1' then
    Error "area code cannot start with one"
  else if Char.equal s.[3] '0' then
    Error "exchange code cannot start with zero"
  else if Char.equal s.[3] '1' then
    Error "exchange code cannot start with one"
  else
    Ok s

let number candidate =
  if contains_alpha candidate then
    Error "letters not permitted"
  else if contains_punctuation candidate then
    Error "punctuations not permitted"
  else
    let extracted_num = String.filter candidate ~f:Char.is_digit in
    match String.length extracted_num with
    | 10 -> check_valid_first_digits extracted_num
    | 11 when Char.equal extracted_num.[0] '1' ->
        check_valid_first_digits (String.drop_prefix extracted_num 1)
    | 11 -> Error "11 digits must start with 1"
    | x when x > 11 -> Error "must not be greater than 11 digits"
    | _ -> Error "must not be fewer than 10 digits"
