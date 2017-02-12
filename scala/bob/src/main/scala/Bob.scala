class Bob {
  def checkUpperCase(input: String) = {
    input.map(_.toUpper) == input && input.map(_.toLower) != input
  }

  def hey(remark: String): String = remark match {
    case empty if remark forall (_.isWhitespace) => "Fine. Be that way!"
    case yell if checkUpperCase(remark) => "Whoa, chill out!"
    case question if remark.endsWith("?") => "Sure."
    case _ => "Whatever."
  }
}
