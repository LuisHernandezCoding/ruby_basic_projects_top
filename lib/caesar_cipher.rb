# frozen_string_literal: true

# Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:
# > caesar_cipher("What a string!", 5)
# => "Bmfy f xywnsl!"
# Quick Tips:
#
# You will need to remember how to convert a string into a number.
# Don’t forget to wrap from z to a.
# Don’t forget to keep the same case.
#
# Solution 1
#
def caesar_cipher(string, shift)
  encrypter = ([*('a'..'z')].zip([*('a'..'z')].rotate(shift)) + [*('A'..'Z')].zip([*('A'..'Z')].rotate(shift))).to_h
  string.chars.map { |char| encrypter.fetch(char, char) }
end
#
# Solution 2
#
def caesar_cipher2(string, shift)
  alphabet = Array('a'..'z')
  non_caps = Hash[alphabet.zip(alphabet.rotate(shift))]
  alphabet = Array('A'..'Z')
  caps = Hash[alphabet.zip(alphabet.rotate(shift))]
  encrypter = non_caps.merge(caps)
  string.chars.map { |char| encrypter.fetch(char, char) }
end
#
# Solution 3
#
def caesar_cipher3(string, shift)
  string_array = string.chars

  new_string_array = []
  string_array.each do |char|
    if char.match?(/[[:alpha:]]/)
      char_to_add = char
      shift.times do
        case char_to_add
        when 'z'
          char_to_add = 'a'
        when 'Z'
          char_to_add = 'A'
        else
          char_to_add = char_to_add.next
        end
      end
      new_string_array.push(char_to_add)
    else
      new_string_array.push(char)
    end
  end
  new_string_array
end

# a simple UI to get input from the user and select solution
def caesar_cipher_ui
  puts 'Enter a string to encrypt:'
  string = gets.chomp
  puts 'Enter the shift factor:'
  shift = gets.chomp.to_i
  puts 'Select a solution (1, 2, or 3):'
  solution = gets.chomp.to_i
  case solution
  when 1
    puts caesar_cipher(string, shift).join
  when 2
    puts caesar_cipher2(string, shift).join
  when 3
    puts caesar_cipher3(string, shift).join
  else
    puts 'Invalid option'
  end
end

caesar_cipher_ui
