module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(first, second)
    if first.size != second.size
      raise ArgumentError, "String lengths don't match"
    end
    count = 0
    first.chars.each_with_index do |char, index|
      # If the characters are not identical, increment the count
      unless second[index] == char
        count += 1
      end
    end
    count
  end
end
