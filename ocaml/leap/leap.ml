let leap_year year =
    if not ((mod) year 4 = 0) then false
    else if ((mod) year 100 = 0) && not ((mod) year 400 = 0) then false
    else true
;;