require 'time'

module BookKeeping
  VERSION = 5
end

class Gigasecond
    GIGASECOND_DURATION = 1000000000

    def self.from(start_time)
        start_time + GIGASECOND_DURATION
    end
end
