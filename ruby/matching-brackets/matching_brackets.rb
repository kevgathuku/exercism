# Write your code for the 'Matching Brackets' exercise in this file. Make the tests in
# `matching_brackets_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/matching-brackets` directory.
class Brackets
  PAIRS = {
    "}" => "{",
    "]" => "[",
    ")" => "("
  }.freeze

  def self.paired?(line)
    stack = []

    line.each_char do |chr|
      if PAIRS.values.include?(chr)
        stack.push(chr)
      elsif PAIRS.key?(chr)
        return false if stack.pop != PAIRS[chr]
      end
    end

    stack.empty?
  end
end
