module PhoneNumber

open System

let clean input = 
   let parsed = input |> String.filter Char.IsDigit
   if String.length parsed = 10 then Ok(UInt64.Parse parsed)
   elif String.length parsed = 11 then if parsed[0] = '1' then Ok(UInt64.Parse parsed) else Error "11 digits must start with 1"
   else Error "incorrect number of digits"