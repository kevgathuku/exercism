let reverse_string candidate =
   String.fold_left (fun acc chr -> String.make 1 chr ^ acc) "" candidate;;
