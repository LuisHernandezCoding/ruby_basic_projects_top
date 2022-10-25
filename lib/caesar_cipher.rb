# a Caesar cipher module that contains 3 methods with different solutions
# it takes a string and a shift factor and returns the modified string
# > caesar_cipher("What a string!", 5)
# => "Bmfy f xywnsl!"
module CaesarCipher
  # Solution 1
  def caesar_cipher(string, shift)
    encrypter = ([*('a'..'z')].zip([*('a'..'z')].rotate(shift)) + [*('A'..'Z')].zip([*('A'..'Z')].rotate(shift))).to_h
    string.chars.map { |char| encrypter.fetch(char, char) }
  end

  # Solution 2
  def caesar_cipher2(string, shift)
    alphabet = Array('a'..'z')
    non_caps = alphabet.zip(alphabet.rotate(shift)).to_h
    alphabet = Array('A'..'Z')
    caps = alphabet.zip(alphabet.rotate(shift)).to_h
    encrypter = non_caps.merge(caps)
    string.chars.map { |char| encrypter.fetch(char, char) }
  end

  # Solution 3
  def caesar_cipher3(string, shift)
    string_array = string.chars

    new_string_array = []
    string_array.each do |char|
      if char.match?(/[[:alpha:]]/)
        char_to_add = char
        shift.times do
          char_to_add = case char_to_add
                        when 'z' then 'a'
                        when 'Z' then 'A'
                        else char_to_add.next
                        end
        end
        new_string_array.push(char_to_add)
      else
        new_string_array.push(char)
      end
    end
    new_string_array
  end
end

# # a simple UI to get input from the user and select solution
# def caesar_cipher_ui
#   puts 'Enter a string to encrypt:'
#   string = gets.chomp
#   puts 'Enter the shift factor:'
#   shift = gets.chomp.to_i
#   puts 'Select a solution (1, 2, or 3):'
#   solution = gets.chomp.to_i
#   case solution
#   when 1
#     puts caesar_cipher(string, shift).join
#   when 2
#     puts caesar_cipher2(string, shift).join
#   when 3
#     puts caesar_cipher3(string, shift).join
#   else
#     puts 'Invalid option'
#   end
# end

# caesar_cipher_ui
