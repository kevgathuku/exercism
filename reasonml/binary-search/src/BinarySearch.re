let find = (numbers, needle) => {
  let len = Array.length(numbers); // 13
  let safeGetByIndex = (arr, idx) =>
    try(Some(arr[idx])) {
    | Invalid_argument(_) => None
    };

  let rec inner = (numbers, needle, offset): option(int) => {
    let len = Array.length(numbers);

    if (len == 0) {
      None;
    } else {
      let mid = len / 2;
      let midVal = safeGetByIndex(numbers, mid);

      switch (midVal) {
      | None => None
      | Some(value) =>
        if (needle == value) {
          Some(offset + mid);
        } else if (needle < value) {
          inner(Array.sub(numbers, 0, mid), needle, offset);
        } else {
          let rightLen = len - mid - 1;
          inner(
            Array.sub(numbers, mid + 1, rightLen),
            needle,
            offset + mid + 1,
          );
        }
      };
    };
  };

  if (len == 0) {
    None;
  } else if (needle < numbers[0] || needle > numbers[len - 1]) {
    None;
  } else {
    inner(numbers, needle, 0);
  };
};
