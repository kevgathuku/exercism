// Generated by BUCKLESCRIPT, PLEASE EDIT WITH CARE
'use strict';

var List = require("bs-platform/lib/js/list.js");
var $$Buffer = require("bs-platform/lib/js/buffer.js");
var $$String = require("bs-platform/lib/js/string.js");
var Caml_string = require("bs-platform/lib/js/caml_string.js");

function explode_string(s) {
  return List.init(s.length, (function (param) {
                return Caml_string.get(s, param);
              }));
}

function removeNonNumeric(str) {
  var charList = List.filter((function ($$char) {
            if ($$char >= /* "0" */48) {
              return $$char <= /* "9" */57;
            } else {
              return false;
            }
          }))(explode_string(str));
  var buffer = $$Buffer.create(List.length(charList));
  List.iter((function ($$char) {
          return $$Buffer.add_char(buffer, $$char);
        }), charList);
  return $$Buffer.contents(buffer);
}

function phoneNumber(input) {
  var parsedNum = removeNonNumeric(input);
  var numDigits = parsedNum.length;
  if (numDigits < 10 || numDigits > 11) {
    return ;
  } else if (numDigits === 11) {
    if (Caml_string.get(parsedNum, 0) !== /* "1" */49) {
      return ;
    } else {
      return $$String.sub(parsedNum, 1, parsedNum.length - 1 | 0);
    }
  } else if (numDigits === 10 && (Caml_string.get(parsedNum, 0) === /* "0" */48 || Caml_string.get(parsedNum, 0) === /* "1" */49)) {
    return ;
  } else {
    return parsedNum;
  }
}

exports.phoneNumber = phoneNumber;
/* No side effect */
