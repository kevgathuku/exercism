let fold ~init:acc ~f lst =
  let rec aux acc = function
    [] -> acc
    | hd :: tl -> aux (f acc hd) tl
  in
  aux acc lst
;;

let length lst =
  fold ~init:0 ~f:(fun acc _ -> acc + 1) lst
;;

let reverse lst =
  fold ~init:[] ~f:(fun acc x -> x :: acc) lst
;;

let map ~f lst =
  reverse ( fold ~init:[] ~f:(fun acc x -> (f x) :: acc) lst )
;;

let filter ~f lst =
  reverse (fold ~init:[] ~f:(fun acc x -> if (f x) then (x :: acc) else acc) lst)
;;

let append lst_a lst_b =
  fold ~init:lst_b ~f:(fun acc x -> x :: acc) (reverse lst_a)
;;

let concat lst =
  fold ~init:[] ~f:(fun acc x -> append x acc) (reverse lst)
;;
