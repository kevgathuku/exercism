open Base

type nucleotide = A | C | G | T

let strands_diff s1 s2 =
  match (s1, s2) with
  | A, A -> 0
  | C, C -> 0
  | G, G -> 0
  | T, T -> 0
  | _, _ -> 1

let hamming_distance s1 s2 =
    match List.map2 s1 s2 ~f:strands_diff with
    | Ok results -> Ok (List.fold_left ~f:(+) ~init:0 results)
    | Unequal_lengths -> Error "left and right strands must be of equal length"
