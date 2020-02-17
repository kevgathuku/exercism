module BookKeeping
  VERSION = 4
end

class Complement
  CONVERSION_TABLE = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze

  def self.of_dna(strand)
    rna = strand.each_char.map { |char| CONVERSION_TABLE[char] }
    # If any of the chars is invalid i.e. returns nil, return an empty string
    rna.all? ? rna.join : ''
  end
end