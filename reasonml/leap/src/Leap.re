let isLeapYear = (year) => {
  if (!(year mod 4 == 0)) {
    false;
  } else if (year mod 100 == 0 && !(year mod 400 == 0)) {
    false;
  } else {
    true;
  }
};
