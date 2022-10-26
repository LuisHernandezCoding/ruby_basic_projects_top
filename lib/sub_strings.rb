# Implement a method #substrings that takes a word as the first argument and
# then an array of valid substrings (your dictionary) as the second argument.
# It should return a hash listing each substring (case insensitive) that was
# found in the original string and how many times it was found.
# make sure your method can handle multiple words

module SubStrings
  # Solution 1
  def substrings(string, dictionary)
    string_array = string.downcase.split
    string_array.each_with_object(Hash.new(0)) do |word, hash|
      dictionary.each do |substring|
        hash[substring] += 1 if word.include?(substring)
      end
    end
  end

  # Solution 2
  def substrings2(string, dictionary)
    words = string.downcase.split
    output_hash = {}
    dictionary.each do |substring|
      words.each do |word|
        if word.include?(substring)
          output_hash.include?(substring) ? output_hash[substring] += 1 : output_hash[substring] = 1
        end
      end
    end
    output_hash
  end

  # Solution 3
  def substrings3(string, dictionary)
    output_hash = {}
    dictionary.each do |substring|
      output_hash[substring] = string.downcase.scan(substring).count if string.downcase.include?(substring)
    end
    output_hash
  end
end
