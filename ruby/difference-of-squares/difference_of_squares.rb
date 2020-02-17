module BookKeeping
  VERSION = 4
end

class Squares
  def initialize(num)
    @num = num
  end

  def square_of_sum
    sum = (1..@num).to_a.sum
    sum * sum
  end

  def sum_of_squares
    (1..@num).map { |i| i * i }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end