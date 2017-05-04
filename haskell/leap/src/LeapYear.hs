module LeapYear (isLeapYear) where


isDivisibleBy4 :: Integer -> Bool
isDivisibleBy4 year =
  mod year 4 == 0

isLeapYear :: Integer -> Bool
isLeapYear year
  | mod year 4 == 0 && mod year 100 == 0 && mod year 400 == 0 = True
  | mod year 4 == 0 && mod year 100 == 0 && mod year 400 /= 0 = False
  | mod year 4 == 0 = True
  | otherwise = False
