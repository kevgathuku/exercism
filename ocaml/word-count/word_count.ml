open Base

let is_punctuation_except_apostrophe c =
  not (Char.is_alphanum c) && not (Char.equal c '\'')

let should_remove ~prev ~curr ~next =
  match curr with
  | '\'' -> (
    match prev, next with
    | Some p, Some n when Char.is_alpha p && Char.is_alpha n -> false
    | _ -> true
  )
  | _ -> false

let remove_unneeded_apostrophes s =
  let chars = String.to_list s in
  let rec aux prev lst =
  match lst with
  | [] -> []
  | [c] ->
    if should_remove ~prev ~curr:c ~next:None then [] else [c]
  | c1 :: (c2 :: _ as tl) ->
    if should_remove ~prev ~curr:c1 ~next:(Some c2)
    then aux (Some c1) tl
    else c1:: aux (Some c1) tl
  in
  aux None chars |> String.of_char_list

let word_count sentence =
  sentence |>
  String.lowercase |>
  (* replace punctuation characters except apostrophes with single space *)
  String.map ~f:(fun c -> if (is_punctuation_except_apostrophe c) then ' ' else c) |>
  remove_unneeded_apostrophes |>
  String.split_on_chars ~on:[' '; '\n'] |>
  List.filter ~f:(Fn.non String.is_empty) |>
  List.fold ~init:(Map.empty (module String)) ~f:(fun acc word ->
    Map.update acc word ~f:(function
      | Some count -> count + 1
      | None -> 1
    ))
