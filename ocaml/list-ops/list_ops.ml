let rec fold ~init:acc ~f lst =
   match lst with
    [] -> acc
    | hd :: tl -> fold ~init:(f acc hd) ~f tl
;;

let rec fold_right (acc: 'b) (f: 'a -> 'b -> 'b) (lst: 'a list) : 'b =
    match lst with
    [] -> acc
    | hd :: tl -> f hd (fold_right acc f tl)
;;

let length lst =
    fold ~init:0 ~f:(fun acc _ -> acc + 1) lst
;;

let reverse lst =
    fold ~init:[] ~f:(fun acc x -> x :: acc) lst
;;

let map ~f lst =
    fold_right [] (fun x acc -> (f x) :: acc) lst
;;

let filter ~f lst =
    fold_right [] (fun x acc -> if (f x) then (x :: acc) else acc) lst
;;

let append lst_a lst_b =
    fold_right lst_b (fun x acc -> x :: acc) lst_a
;;

let concat lst =
    fold_right [] (fun x acc -> append x acc) lst
;;
