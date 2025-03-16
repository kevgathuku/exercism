open Base;

let containsAlphaChar = (s: string) =>
  String.exists(s, ~f=c => Char.is_alpha(c));

let isPunctuation = (c: char) =>
  Char.equal(c, '@') || Char.equal(c, ':') || Char.equal(c, '!');

let containsPunctuation = (s: string) =>
  String.exists(s, ~f=c => isPunctuation(c));

let checkValidFirstDigits = (s: string) =>
  if (Char.equal(s.[0], '0')) {
    Error("area code cannot start with zero");
  } else if (Char.equal(s.[0], '1')) {
    Error("area code cannot start with one");
  } else if (Char.equal(s.[3], '0')) {
    Error("exchange code cannot start with zero");
  } else if (Char.equal(s.[3], '1')) {
    Error("exchange code cannot start with one");
  } else {
    Ok(s);
  };

let number = candidate =>
  if (containsAlphaChar(candidate)) {
    Error("letters not permitted");
  } else if (containsPunctuation(candidate)) {
    Error("punctuations not permitted");
  } else {
    let parsedNum = String.filter(candidate, ~f=Char.is_digit);
    let firstChar = parsedNum.[0];
    switch (String.length(parsedNum)) {
    | 10 => checkValidFirstDigits(parsedNum)
    | 11 when Char.equal(firstChar, '1') =>
      checkValidFirstDigits(String.drop_prefix(parsedNum, 1))
    | 11 => Error("11 digits must start with 1")
    | x when x > 11 => Error("more than 11 digits")
    | _ => Error("incorrect number of digits")
    };
  };
