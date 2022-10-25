# Implement a method #substrings that takes a word as the first argument and
# then an array of valid substrings (your dictionary) as the second argument.
# It should return a hash listing each substring (case insensitive) that was
# found in the original string and how many times it was found.
# make sure your method can handle multiple words
#
# Solution 1
#
def substrings(string, dictionary)
  string_array = string.downcase.split
  string_array.each_with_object(Hash.new(0)) do |word, hash|
    dictionary.each do |substring|
      hash[substring] += 1 if word.include?(substring)
    end
  end
end

#
# Solution 2
#
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

#
# Solution 3
#
def substrings3(string, dictionary)
  output_hash = {}
  dictionary.each do |substring|
    output_hash[substring] = string.downcase.scan(substring).count if string.downcase.include?(substring)
  end
  output_hash
end

# generic test method
def generic_test()
  dictionary = %w[below down go going horn how howdy it i low own part partner sit]
  string = 'Howdy partner, sit down! How\'s it going?'
  p 'actual dictionary:'
  p dictionary
  p 'actual string:'
  p string
  p 'solution 1:'
  p substrings('below', dictionary)
  p substrings(string, dictionary)
  p 'solution 2:'
  p substrings2('below', dictionary)
  p substrings2(string, dictionary)
  p 'solution 3:'
  p substrings3('below', dictionary)
  p substrings3(string, dictionary)
end

# simple ui to know if run a generic test or ask the user to enter a string and select solution
puts 'Enter 1 to run generic test or 2 to enter a string:'
input = gets.chomp
case input
when '1'
  generic_test
when '2'
  puts 'Enter a string:'
  string = gets.chomp
  puts 'Enter a dictionary:'
  dictionary = gets.chomp.split
  puts 'Enter 1 for solution 1, 2 for solution 2 or 3 for solution 3:'
  input = gets.chomp
  case input
  when '1'
    p substrings(string, dictionary)
  when '2'
    p substrings2(string, dictionary)
  when '3'
    p substrings3(string, dictionary)
  else
    p 'invalid input'
  end
else
  p 'invalid input'
end
