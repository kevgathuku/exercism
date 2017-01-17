module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(first, second)
    if first.size != second.size
      raise ArgumentError, "String lengths don't match"
    end
    first.chars.zip(second.chars).select{|pair|  pair[0] != pair[1] }.length
  end
end
