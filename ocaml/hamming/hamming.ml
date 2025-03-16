open Base

type nucleotide = A | C | G | T

let iterate_with_fold2 list1 list2 ~f ~init =
  try
    List.fold2_exn list1 list2 ~init ~f
  with
  | Invalid_argument _ -> failwith "Lists must have equal length"

let hamming_distance s1 s2 =
  let strands_diff s1 s2 =
  match (s1, s2) with
  | A, A -> 0
  | C, C -> 0
  | G, G -> 0
  | T, T -> 0
  | _, _ -> 1
  in
  let f acc n1 n2 = acc + strands_diff n1 n2 in
  match ((List.length s1), (List.length s2)) with
  | (0, 0) -> Ok(0)
  | (0, _) -> Error "left strand must not be empty"
  | (_, 0) -> Error "right strand must not be empty"
  | (x, y) when not (phys_equal x y) -> Error "left and right strands must be of equal length"
  | (x, y) when phys_equal x y -> Ok(iterate_with_fold2 s1 s2 ~f ~init:0)
