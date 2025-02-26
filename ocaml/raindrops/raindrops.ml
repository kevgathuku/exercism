let raindrop num =
  let result = "" in
  let result = if num mod 3 == 0 then "Pling" else result in
  let result = if num mod 5 == 0 then result ^ "Plang" else result in
  let result = if num mod 7 == 0 then result ^ "Plong" else result in
  if result = "" then string_of_int num else result;;
