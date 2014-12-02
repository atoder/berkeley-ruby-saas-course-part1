module FunWithStrings
  def palindrome?
    clean_string = self.gsub(/[\W]*/, '').downcase
    return clean_string == clean_string.reverse
  end
  def count_words
    hash = Hash.new
    self.gsub(/[^a-z0-9\s]/i, '').split().each do |i| 
      j = i.downcase
      if !hash.has_key?(j)
        hash[j] = 1
      else
        hash[j] += 1
      end
    end
    return hash
  end
  def anagram_groups
    arr = self.split(' ')
    arr.group_by { |element| element.downcase.chars.sort }.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
