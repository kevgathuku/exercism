module BookKeeping
  VERSION = 2
end

module RomanNumerals
  def to_roman
    roman_constants = {
      1 => "I",
      4 => "IV",
      5 => "V",
      9 => "IX",
      10 => "X",
      40 => "XL",
      50 => "L",
      90 => "XC",
      100 => "C",
      400 => "CD",
      500 => "D",
      900 => "CM",
      1000 => "M",
    }
    result = []
    num = self

    roman_constants.keys.reverse_each { |key|
      while num >= key
        num -= key
        result << roman_constants[key]
      end
    }

    result.join
  end
end

class Integer
  include RomanNumerals
end