class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    return [] if @limit < 2

    candidates = (2..@limit).to_a
    marked = []

    candidates.each { |candidate|
      largest_multiple = @limit / candidate

      multiples_of_candidate = (2..largest_multiple).map { |multiple| candidate * multiple }
      marked.concat(multiples_of_candidate)
    }

    candidates - marked
  end
end

module BookKeeping
  VERSION = 1
end