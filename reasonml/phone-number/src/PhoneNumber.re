let explode_string = s => List.init(String.length(s), String.get(s));

let fromList = charList => {
  let buffer = Buffer.create(List.length(charList));
  List.iter(char => Buffer.add_char(buffer, char), charList);
  Buffer.contents(buffer);
};

let removeNonNumeric = str => {
  str
    |> explode_string
    |> List.filter(char => char >= '0' && char <= '9')
    |> fromList;
};

let phoneNumber = input => {
  let parsedNum = removeNonNumeric(input);
  let numDigits = String.length(parsedNum);
  if (numDigits < 10 || numDigits > 11) {
    None;
  } else if (numDigits == 11) {
    if (parsedNum.[0] != '1') {
      None;
    } else {
      let numWithoutCode =
        String.sub(parsedNum, 1, String.length(parsedNum) - 1);
      Some(numWithoutCode);
    };
  } else if (numDigits == 10) {
    if (parsedNum.[0] == '0' || parsedNum.[0] == '1') {
      None;
    } else {
      Some(parsedNum);
    };
  } else {
    Some(parsedNum);
  };
};
