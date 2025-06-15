open Base

let is_quote chr = Char.equal '\'' chr

let is_allowed chr =
  Char.is_alphanum chr || Char.is_whitespace chr || is_quote chr

let remove_enclosing_quotes = String.strip ~drop:is_quote

let word_count sentence =
  sentence |>
  String.lowercase |>
  String.map ~f:(fun c -> if (is_allowed c) then c else ' ') |>
  String.split_on_chars ~on:[' '; '\n'] |>
  List.filter ~f:(Fn.non String.is_empty) |>
  List.map ~f:remove_enclosing_quotes |>
  List.fold ~init:(Map.empty (module String)) ~f:(fun acc word ->
    Map.update acc word ~f:(function
      | Some count -> Int.succ count
      | None -> 1
    ))
