(* let fold init:'acc -> f:('acc -> 'a -> 'acc) -> 'a list -> 'acc *)
(* The ~init arg has been assigned to acc, hence 'init' is undefined *)
(* You need to include the ~ in the recursive function call to name individual arguments *)
let rec fold ~init:acc ~f lst =
   match lst with
    [] -> acc
    | hd :: tl -> fold ~init:(f acc hd) ~f tl
;;

(* Evaluates the list from the last element to the first. *)
(* Returns elements in the order it received them *)
let rec fold_right ~init:acc ~f lst =
    match lst with
    [] -> acc
    | hd :: tl -> f hd (fold_right ~init:acc ~f tl)
;;

let length lst =
    (* match lst with
    | [] -> 0
    | _ :: tl -> 1 + length tl *)
    fold ~init:0 ~f:(fun acc _ -> acc + 1) lst
;;

let reverse lst =
    (* The elements are added to a new list in reverse order *)
    (* The first element is added to the end of the list, then the rest follow*)
    fold ~init:[] ~f:(fun acc x -> x :: acc) lst
;;

let map ~f lst =
    (* match lst with
    | [] -> []
    | hd :: tl -> let r = f hd in r :: map f tl *)
    fold_right ~init:[] ~f:(fun x acc -> (f x) :: acc) lst
;;

let filter ~f lst =
    fold ~init:[] ~f:(fun acc x -> if (f x) then (x :: acc) else acc) (reverse lst)
;;

let append lst_a lst_b =
    fold ~init:lst_b ~f:(fun acc x -> x :: acc) (reverse lst_a)
;;

let concat lst =
    fold ~init:[] ~f:(fun acc x -> append acc x) lst
;;
