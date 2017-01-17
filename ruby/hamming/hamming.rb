module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(first, second)
    if first.size != second.size
      raise ArgumentError, "String lengths don't match"
    end
    first.chars.zip(second.chars).inject(0) do |count, el|
      el[0] == el[1]  ? count : count + 1
    end
  end
end
