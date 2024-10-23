module AnnalynsInfiltration

let canFastAttack (knightIsAwake: bool) : bool = not knightIsAwake

let canSpy (knightIsAwake: bool) (archerIsAwake: bool) (prisonerIsAwake: bool) : bool =
    match knightIsAwake, archerIsAwake, prisonerIsAwake with
    | false, false, false -> false
    | true, false, false -> true
    | false, true, false -> true
    | false, false, true -> true
    | false, true, true -> true
    | true, false, true -> true
    | true, true, false -> true
    | true, true, true -> true

let canSignalPrisoner (archerIsAwake: bool) (prisonerIsAwake: bool) : bool =
    match archerIsAwake, prisonerIsAwake with
    | false, true -> true
    | true, false -> false
    | true, true -> false
    | false, false -> false

let canFreePrisoner (knightIsAwake: bool) (archerIsAwake: bool) (prisonerIsAwake: bool) (petDogIsPresent: bool) : bool =
    match knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent with
    | true, true, true, true -> false
    | true, true, true, false -> false
    | true, true, false, false -> false
    | true, true, false, true -> false
    | true, false, true, false -> false
    | true, false, true, true -> true
    | true, false, false, true -> true
    | true, false, false, false -> false
    | false, true, true, false -> false
    | false, true, true, true -> false
    | false, true, false, true -> false
    | false, true, false, false -> false
    | false, false, false, true -> true
    | false, false, true, true -> true
    | false, false, true, false -> true
    | false, false, false, false -> false
