module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(first, second)
    raise ArgumentError, "String lengths don't match" unless first.size == second.size
    # Prefer each_char, which returns an Enumerator
    # chars converts the enumerator to an array
    first.each_char.zip(second.each_char).count { |nuc1, nuc2| nuc1 != nuc2 }
  end
end
