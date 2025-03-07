// Generated by BUCKLESCRIPT, PLEASE EDIT WITH CARE
'use strict';

var Jest = require("@glennsl/bs-jest/src/jest.js");
var PhoneNumber$PhoneNumber = require("../src/PhoneNumber.bs.js");

Jest.describe("PhoneNumber", (function (param) {
        Jest.test("cleans the number", (function (param) {
                return Jest.Expect.toEqual("2234567890", Jest.Expect.expect(PhoneNumber$PhoneNumber.phoneNumber("(223) 456-7890")));
              }));
        Jest.test("cleans numbers with dots", (function (param) {
                return Jest.Expect.toEqual("2234567890", Jest.Expect.expect(PhoneNumber$PhoneNumber.phoneNumber("223.456.7890")));
              }));
        Jest.test("cleans numbers with multiple spaces", (function (param) {
                return Jest.Expect.toEqual("2234567890", Jest.Expect.expect(PhoneNumber$PhoneNumber.phoneNumber("223 456   7890   ")));
              }));
        Jest.test("invalid when 9 digits", (function (param) {
                return Jest.Expect.toEqual(undefined, Jest.Expect.expect(PhoneNumber$PhoneNumber.phoneNumber("123456789")));
              }));
        Jest.test("invalid when 11 digits does not start with a 1", (function (param) {
                return Jest.Expect.toEqual(undefined, Jest.Expect.expect(PhoneNumber$PhoneNumber.phoneNumber("22234567890")));
              }));
        Jest.test("valid when 11 digits and starting with 1", (function (param) {
                return Jest.Expect.toEqual("2234567890", Jest.Expect.expect(PhoneNumber$PhoneNumber.phoneNumber("12234567890")));
              }));
        Jest.test("valid when 11 digits and starting with 1 even with punctuation", (function (param) {
                return Jest.Expect.toEqual("2234567890", Jest.Expect.expect(PhoneNumber$PhoneNumber.phoneNumber("+1 (223) 456-7890")));
              }));
        Jest.test("invalid when more than 11 digits", (function (param) {
                return Jest.Expect.toEqual(undefined, Jest.Expect.expect(PhoneNumber$PhoneNumber.phoneNumber("321234567890")));
              }));
        Jest.test("invalid with letters", (function (param) {
                return Jest.Expect.toEqual(undefined, Jest.Expect.expect(PhoneNumber$PhoneNumber.phoneNumber("123-abc-7890")));
              }));
        Jest.test("invalid with punctuations", (function (param) {
                return Jest.Expect.toEqual(undefined, Jest.Expect.expect(PhoneNumber$PhoneNumber.phoneNumber("123-@:!-7890")));
              }));
        Jest.test("invalid if area code starts with 0", (function (param) {
                return Jest.Expect.toEqual(undefined, Jest.Expect.expect(PhoneNumber$PhoneNumber.phoneNumber("(023) 456-7890")));
              }));
        Jest.test("invalid if area code starts with 1", (function (param) {
                return Jest.Expect.toEqual(undefined, Jest.Expect.expect(PhoneNumber$PhoneNumber.phoneNumber("(123) 456-7890")));
              }));
        Jest.test("invalid if exchange code starts with 0", (function (param) {
                return Jest.Expect.toEqual(undefined, Jest.Expect.expect(PhoneNumber$PhoneNumber.phoneNumber("(123) 056-7890")));
              }));
        return Jest.test("invalid if exchange code starts with 1", (function (param) {
                      return Jest.Expect.toEqual(undefined, Jest.Expect.expect(PhoneNumber$PhoneNumber.phoneNumber("(123) 156-7890")));
                    }));
      }));

/*  Not a pure module */
