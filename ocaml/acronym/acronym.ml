open Base

let replace_dashes s =
  String.map s ~f:(fun c -> if (Char.equal c '-') || (Char.equal c '_') then ' ' else c)

let acronym phrase =
  phrase
  |> replace_dashes
  |> String.uppercase
  |> String.split_on_chars ~on:[ ' '; '_'; '-' ]
  |> List.filter ~f:(fun x -> not (String.is_empty x))
  |> List.map ~f:(fun s -> s.[0])
  |> String.of_char_list
