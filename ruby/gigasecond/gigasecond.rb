module BookKeeping
  VERSION = 5
end

class Gigasecond
  GIGASECOND = 1_000_000_000

  def self.from(moment)
    moment + GIGASECOND
  end
end
