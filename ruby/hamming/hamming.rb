module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(first, second)
    raise ArgumentError, "String lengths don't match" unless first.size == second.size
    first.chars.zip(second.chars).select{|nuc1, nuc2|  nuc1 != nuc2 }.length
  end
end