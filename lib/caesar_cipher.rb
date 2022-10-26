# a Caesar cipher module that contains 3 methods with different solutions
# it takes a string and a shift factor and returns the modified string
# > caesar_cipher("What a string!", 5)
# => "Bmfy f xywnsl!"
module CaesarCipher
  # Solution 1
  def caesar_cipher(string, shift)
    encrypter = ([*('a'..'z')].zip([*('a'..'z')].rotate(shift)) + [*('A'..'Z')].zip([*('A'..'Z')].rotate(shift))).to_h
    string.chars.map { |char| encrypter.fetch(char, char) }.join
  end

  # Solution 2
  def caesar_cipher2(string, shift)
    alphabet = Array('a'..'z')
    non_caps = alphabet.zip(alphabet.rotate(shift)).to_h
    alphabet = Array('A'..'Z')
    caps = alphabet.zip(alphabet.rotate(shift)).to_h
    encrypter = non_caps.merge(caps)
    string.chars.map { |char| encrypter.fetch(char, char) }.join
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
    new_string_array.join
  end
end
