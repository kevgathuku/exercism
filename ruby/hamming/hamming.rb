module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(first, second)
    raise ArgumentError, "String lengths don't match" unless first.size == second.size
    first.chars.zip(second.chars).select{|pair|  pair[0] != pair[1] }.length
  end
end
