class Bob {
  def yelling(input: String): Boolean = {
    input.toUpperCase() == input && input.toLowerCase() != input
  }

  def question(input: String): Boolean = {
    input.endsWith("?")
  }

  def silence(input: String): Boolean = {
    input forall (_.isWhitespace)
  }

  def hey(remark: String): String = remark match {
    case response if silence(remark) => "Fine. Be that way!"
    case response if yelling(remark) => "Whoa, chill out!"
    case response if question(remark) => "Sure."
    case _ => "Whatever."
  }
}
