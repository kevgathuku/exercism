module BookKeeping
  VERSION = 4
end

class Complement
  CONVERSION_TABLE = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U',
  }.freeze

  def self.of_dna(strand)
    strand.gsub(/[GCTA]/, CONVERSION_TABLE)
  end
end
