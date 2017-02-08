object SumOfMultiples {
  def sumOfMultiples(factors: Set[Int], limit: Int): Int = {
    var sum: Int = 0
    for (a <- 1 until limit) {
      if (factors.exists(factor => a % factor == 0)) {
        sum += a
      }
    }
    sum
  }
}
