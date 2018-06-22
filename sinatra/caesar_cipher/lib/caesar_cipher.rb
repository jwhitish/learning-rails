
def encrypt(string, key = 0)
  ascii = string.downcase.chars.map(&:ord)
  shifted = ascii.map do |c|
    if c == 32 #check if space
      c = 32
    else
      if (c + key.to_i) < 123 #check if < lowercase z
        c + key.to_i
      else
        (c + key.to_i) - 26 #wraps to beg
      end
    end
  end
  shifted_char = shifted.map {|c| c.chr }.join
  shifted_char
end

def decrypt(string, key = 0)
  ascii = string.downcase.chars.map(&:ord)
  shifted = ascii.map do |c|
    if c == 32
      c = 32
    else
      if (c - key.to_i) > 96
        c - key.to_i
      else
        (c - key.to_i) + 26
      end
    end
  end
  shifted_char = shifted.map {|c| c.chr}.join
  shifted_char
end
