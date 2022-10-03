# Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:
# > caesar_cipher("What a string!", 5)
# => "Bmfy f xywnsl!"
# Quick Tips:
#
# You will need to remember how to convert a string into a number.
# Don’t forget to wrap from z to a.
# Don’t forget to keep the same case.
#
# Solution
#
def caesar_cipher(string, shift)
  encrypter = ([*('a'..'z')].zip([*('a'..'z')].rotate(shift)) + [*('A'..'Z')].zip([*('A'..'Z')].rotate(shift))).to_h
  string.chars.map { |char| encrypter.fetch(char, char) }
end

p output = caesar_cipher('What a string!', 5)
