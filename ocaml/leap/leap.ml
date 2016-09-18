let year_mod num year =
    year mod num = 0
;;

let leap_year year =
    if not (year_mod 4 year) then false
    else if (year_mod 100 year) && not (year_mod 400 year) then false else true
;;
