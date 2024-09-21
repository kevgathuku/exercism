module Anagram


let getFrequency (source: string) =
  source.ToLower() |> Seq.sort |> Seq.toList

let findAnagrams sources (target: string) = 
  sources
  |> List.filter (fun (source: string) -> not (source.ToLower() = target.ToLower()))
  |> List.filter (fun source -> getFrequency source = getFrequency target )
  
