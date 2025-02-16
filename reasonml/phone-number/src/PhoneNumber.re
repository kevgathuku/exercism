let explode_string = s => List.init(String.length(s), String.get(s));

let fromList = charList => {
  let buffer = Buffer.create(List.length(charList)); /* Initialize buffer */

  List.iter(char => Buffer.add_char(buffer, char), charList); /* Append characters */

  Buffer.contents(buffer); /* Convert buffer to string */
};

let removeNonNumeric = str => {
  str
    |> explode_string
    |> List.filter(char => char >= '0' && char <= '9')
    |> fromList;
};


let containsAlphabetic = str =>
  str
  |> explode_string
  |> List.exists(char => (char >= 'a' && char <= 'z') || (char >= 'A' && char <= 'Z'));

let phoneNumber = (input) => {
  let parsedNum = removeNonNumeric(input);
  let numDigits = String.length(parsedNum);
  if (numDigits == 9 || numDigits > 11 || containsAlphabetic(input)) {
    None;
  } else if (numDigits == 11) {
    if ( parsedNum.[0] != '1') { None } else {
      let numWithoutCode = String.sub(parsedNum, 1, String.length(parsedNum) - 1);
      Some(numWithoutCode)
    }
  } else {
    Some(parsedNum);
  }
};
