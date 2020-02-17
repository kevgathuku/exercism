require "set"

class Pangram
  def self.pangram?(phrase)
    return false if phrase.length == 0

    chars_set = ("a".."z").to_set
    phrase_set = phrase.downcase.chars.to_set
    chars_set.subset?(phrase_set)
  end
end

module BookKeeping
  VERSION = 6
end
