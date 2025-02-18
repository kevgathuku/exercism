open Base

let acronym phrase =
  phrase
  |> String.uppercase
  |> String.split_on_chars ~on:[ ' '; '_'; '-' ]
  |> List.filter ~f:(fun x -> not (String.is_empty x))
  |> List.map ~f:(fun s -> s.[0])
  |> String.of_char_list
