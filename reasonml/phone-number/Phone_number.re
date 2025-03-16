open Base;

let isNumeric = char => Char.(char >= '0' && char <= '9');

let number = cand => {
  let parsedNum = String.filter(cand, ~f=isNumeric);
  let numDigits = String.length(parsedNum);
  let firstChar = String.get(parsedNum, 0);
  if (numDigits < 10) {
    Error("incorrect number of digits");
  } else if (numDigits > 11) {
    Error("more than 11 digits");
  } else if (numDigits == 11) {
    if (! Char.equal(firstChar, '1')) {
      Error("11 digits must start with 1");
    } else {
      let numWithoutCode = String.drop_prefix(parsedNum, 1);
      Ok(numWithoutCode);
    };
  } else if (numDigits == 10) {
    if (Char.equal(firstChar, '0')) {
      Error ("area code cannot start with zero");
    } else if (Char.equal(firstChar, '1')) {
      Error ("area code cannot start with one");
    } else {
      Ok(parsedNum);
    };
  } else {
    Ok(parsedNum);
  }
};
