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
(* These are no longer named arguments, but positional arguments *)
let rec fold_right (acc: 'b) (f: 'a -> 'b -> 'b) (lst: 'a list) : 'b =
    match lst with
    [] -> acc
    | hd :: tl -> f hd (fold_right acc f tl)
;;

let length lst =
    fold ~init:0 ~f:(fun acc _ -> acc + 1) lst
;;

let reverse lst =
    (* The first element is added to the end of the list, then the rest follow*)
    fold ~init:[] ~f:(fun acc x -> x :: acc) lst
;;

let map ~f lst =
    fold_right [] (fun x acc -> (f x) :: acc) lst
;;

let filter ~f lst =
    fold_right [] (fun x acc -> if (f x) then (x :: acc) else acc) lst
;;

let append lst_a lst_b =
    (* Appends elements in list_b to list_a and returns a new list *)
    (* Starts with list_b elements, then prepends list_a elements, from last to first *)
    fold_right lst_b (fun x acc -> x :: acc) lst_a
;;

let concat lst =
    (* Merges two lists into one *)
    fold_right [] (fun x acc -> append x acc) lst
;;
