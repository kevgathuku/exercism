object SumOfMultiples {
  def sumOfMultiples(factors: Set[Int], limit: Int): Int = {
    val l = 1 until limit
    l.foldLeft(0)((x, y) => if (factors exists (factor => y % factor == 0)) x + y else x)
  }
}
