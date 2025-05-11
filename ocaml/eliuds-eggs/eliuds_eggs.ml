open Base

let egg_count number =
  let rec count_binary_ones num acc =
    if num = 0 then acc
    else
      let new_acc = if (Int.rem num 2) = 1 then Int.succ acc else acc in
      count_binary_ones (num / 2) new_acc
  in
  count_binary_ones number 0
