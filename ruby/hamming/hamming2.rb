# http://exercism.io/submissions/034512d14d334ed996c0a707917e46f6
# Courtesy of http://exercism.io/KarlHarnois

module BookKeeping
  VERSION = 3
end

class Hamming

def self.compute(x, y)
    if x.size != y.size
      raise ArgumentError, "String lengths don't match"
    end
    # Returns array of the form
    # [["G", 0], ["G", 1], ["A", 2], ["C", 3], ["G", 4]]
    left  = x.chars.map.with_index { |item, index| [item, index] }
    right = y.chars.map.with_index { |item, index| [item, index] }

    if left.count > right.count
      # You can subtract arrays. Mind == blown!!
      (left - right).count
    else
      (right - left).count
    end
  end
end
