module BookKeeping
  VERSION = 3
end

class Raindrops
  def self.convert(num)
    final = ''
    if num % 3 == 0
      final += 'Pling'
    end
    if num % 5 == 0
      final += 'Plang'
    end
    if num % 7 == 0
      final += 'Plong'
    end
    if final == ''
      final = num.to_s
    end
    final
  end
end
