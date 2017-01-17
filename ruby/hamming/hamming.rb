module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(first, second)
    if first.size != second.size
      raise ArgumentError, "String lengths don't match"
    end
    count = 0
    first.chars.zip(second.chars).each do |first, second|
      count += 1 unless second == first
    end
    count
  end
end
