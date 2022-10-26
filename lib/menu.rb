require_relative 'console_printer'
require_relative 'graphics'
require_relative 'bubble_sort'
require_relative 'caesar_cipher'
require_relative 'stock_picker'
require_relative 'sub_strings'

module MenuStockPicker
  include ConsolePrinter
  include Graphics
  include StockPicker

  def stock_picker_menu
    message = getting_stock_picker_title
    message << 'Enter the stock prices:'
    message << 'Prices must be separated by a space'
    message << 'The prices must be numbers'
    message << ('═' * 23)
    message << 'Example: 17 3 6 9 15 8 6 1 10'
    message << ('═' * 23)
    message << "Or type 'random' to generate random prices"
    message << ('═' * 23)
    system('clear') or system('cls')
    print_message(message, 102, 'bg_black', 'bg_purple')
    print_input_field(100, 'bg_black')
    chose = ask_for_input(%w[1..9 random])
    array = chose == 'random' ? Array.new(15) { rand(10..99) } : chose.split.map(&:to_i)
    start_stock_picker(array)
  end

  def start_stock_picker(array)
    message = getting_stock_picker_title
    message << 'Stock prices:'
    message << 'day => price | day => price | day => price'
    array.each_with_index.each_slice(3) do |slice|
      message << slice.map do |price, index|
        "#{index.to_s.rjust(2, '0')} => #{price.to_s.rjust(3, '0')}".center(12)
      end.join(' | ')
    end
    message << ('═' * 23)
    message << 'Best days to buy and sell:'
    message << stock_picker(array).join(' and ')
    message << ('═' * 23)
    message += stock_picker_time(array)
    message << 'Press any key to return to main menu'
    system('clear') or system('cls')
    print_message(message, 102, 'bg_black', 'bg_purple')
    gets
    main_menu
  end

  def stock_picker_time(array)
    message = []
    time = Time.now
    stock_picker(array)
    message << "First solution took #{(Time.now - time) * 1000} ms"
    time = Time.now
    stock_picker2(array)
    message << "Second solution took #{(Time.now - time) * 1000} ms"
    time = Time.now
    stock_picker3(array)
    message << "Third solution took #{(Time.now - time) * 1000} ms"
    message
  end
end

module MenuSubStrings
  include ConsolePrinter
  include Graphics
  include SubStrings

  def substrings_menu_string
    message = getting_substrings_title
    message << ('═' * 23)
    message << 'Enter a string to search:'
    message << 'Example: Howdy partner, sit down! How\'s it going?'
    message << ('═' * 23)
    message << 'Or type "random" to generate a random string'
    message << ('═' * 23)
    system('clear') or system('cls')
    print_message(message, 102, 'bg_black', 'bg_dark gray')
    print_input_field(100, 'bg_black')
    chose = ask_for_input(%w[1..9 a..z A..Z random])
    string = 'Howdy partner, sit down! How\'s it going?' if chose == 'random'
    string = chose if chose != 'random'
    substrings_menu_words(string)
  end

  def substrings_menu_words(string)
    message = getting_substrings_title
    message << 'String to search:'
    message << string
    message << ('═' * 23)
    message << 'Enter the words to search:'
    message << 'Words must be separated by a space'
    message << 'The words must be letters'
    message << ('═' * 23)
    message << 'Example: below down go going horn how howdy it i low own part partner sit'
    message << ('═' * 23)
    system('clear') or system('cls')
    print_message(message, 102, 'bg_black', 'bg_dark gray')
    print_input_field(100, 'bg_black')
    chose = ask_for_input(%w[1..9 a..z A..Z])
    dictionary = 'below down go going horn how howdy it i low own part partner sit'.split if chose == 'random'
    dictionary = chose.split if chose != 'random'
    start_substrings(string, dictionary)
  end

  def start_substrings(string, dictionary)
    message = getting_substrings_title
    message << 'String to search:'
    message << string.scan(/\S.{0,80}\S(?=\s|$)|\S+/).join
    message << ('═' * 23)
    message << 'Words to search:'
    msg = dictionary.join(' ')
    message << msg.scan(/\S.{0,80}\S(?=\s|$)|\S+/).join
    message << ('═' * 23)
    message << 'Results:'
    ordered_result = substrings3(string, dictionary).sort_by { |_key, value| value }.reverse
    ordered_result.each_slice(6) { |slice| message << slice.map { |word, count| "#{word}: #{count}" }.join(' | ') }
    message << ('═' * 23)
    message += check_substrings_time(string, dictionary)
    message << 'Press any key to return to main menu'
    system('clear') or system('cls')
    print_message(message, 102, 'bg_black', 'bg_dark gray')
    gets
    main_menu
  end

  def check_substrings_time(string, dictionary)
    output = []
    time = Time.now
    substrings(string, dictionary)
    output << "First solution took #{(Time.now - time) * 1000} ms"
    time = Time.now
    substrings2(string, dictionary)
    output << "Second solution took #{(Time.now - time) * 1000} ms"
    time = Time.now
    substrings3(string, dictionary)
    output << "Third solution took #{(Time.now - time) * 1000} ms"
    output
  end
end

module MenuCaesarCipher
  include ConsolePrinter
  include Graphics
  include CaesarCipher

  def caesar_cipher_menu
    message = getting_caesar_cipher_title
    message << 'Enter a string to encrypt:'
    system('clear') or system('cls')
    print_message(message, 102, 'bg_black', 'bg_green')
    print_input_field(100, 'bg_black')
    string = gets.chomp
    message = getting_caesar_cipher_title
    message << 'Enter the shift factor:'
    system('clear') or system('cls')
    print_message(message, 102, 'bg_black', 'bg_green')
    print_input_field(100, 'bg_black')
    shift = ask_for_input(%w[1 2 3 4 5 6 7 8 9]).to_i
    start_caesar_cipher(string, shift)
  end

  def start_caesar_cipher(string, shift)
    message = getting_caesar_cipher_title
    message << "Original string: #{string}"
    message << "Shift factor: #{shift}"
    time = Time.now
    message << "First solution: #{caesar_cipher(string, shift)}"
    message << "Time elapsed: #{(Time.now - time) * 1000} ms"
    time = Time.now
    message << "Second solution: #{caesar_cipher2(string, shift)}"
    message << "Time elapsed: #{(Time.now - time) * 1000} ms"
    time = Time.now
    message << "Third solution: #{caesar_cipher3(string, shift)}"
    message << "Time elapsed: #{(Time.now - time) * 1000} ms"
    message << 'Press any key to return to main menu'
    system('clear') or system('cls')
    print_message(message, 102, 'bg_black', 'bg_green')
    gets
    main_menu
  end
end

module MenuBubbleSort
  include ConsolePrinter
  include Graphics
  include BubbleSort

  def bubble_sort_menu
    message = getting_bubble_sort_title
    message << ('═' * 23)
    message << 'Bubble Sort'
    message << ('═' * 23)
    message << 'Enter the number of elements you want to sort'
    message << 'It must be a number between 1 and 100'
    message << 'The elements will be randomly generated'
    message << ('═' * 23)
    message << 'Or enter random to test with a random array'
    message << ('═' * 23)
    system('clear') or system('cls')
    print_message(message, 102, 'bg_black', 'bg_brown')
    print_input_field(100, 'bg_black')
    chose = ask_for_input(%w[1 2 3 4 5 6 7 8 9 random])
    array = Array.new(chose.to_i) { rand(1..100) } if chose.match(/[1-9]/)
    array = Array.new(rand(1..50)) { rand(1..100) } if chose == 'random'
    start_bubble_sort(array)
  end

  def start_bubble_sort(array)
    message = getting_bubble_sort_title
    message << 'Original Array:'
    array.each_slice(15) { |slice| message << slice.to_s }
    message << 'Sorted Array with first solution:'
    time = Time.now
    bubble_sort(array).each_slice(15) { |slice| message << slice.to_s }
    message << "Time elapsed: #{(Time.now - time) * 1000} ms"
    message << 'Sorted Array with second solution:'
    time = Time.now
    bubble_sort2(array).each_slice(15) { |slice| message << slice.to_s }
    message << "Time elapsed: #{(Time.now - time) * 1000} ms"
    message << 'Sorted Array with third solution:'
    time = Time.now
    bubble_sort3(array).each_slice(15) { |slice| message << slice.to_s }
    message << "Time elapsed: #{(Time.now - time) * 1000} ms"
    message << 'Press any key to return to main menu'
    system('clear') or system('cls')
    print_message(message, 102, 'bg_black', 'bg_brown')
    gets
    main_menu
  end
end

class Menu
  include ConsolePrinter
  include Graphics
  include MenuBubbleSort
  include MenuCaesarCipher
  include MenuStockPicker
  include MenuSubStrings

  def print_menu(title, options)
    program_title = getting_title
    menu = getting_menu_block(title, options)
    print_args = []
    program_title.each_with_index do |line, index|
      menu_line = menu[index] || (' ' * 23)
      print_args << (line + menu_line)
    end
    system('clear') or system('cls')
    print_message(print_args, 102, 'bg_black', 'bg_blue')
    print_input_field(100, 'bg_black')
  end

  def ask_for_input(options = %w[1 2 3 4])
    chose = gets.chomp.downcase
    chose = gets.chomp.downcase until chose.match(/[#{options.join}]/)
    chose
  end

  def main_menu
    print_menu('Main Menu', ['Bubble Sort', 'Caesar Cipher', 'Stock Picker', 'Sub Strings'])
    chose = ask_for_input
    case chose
    when '1' then bubble_sort_menu
    when '2' then caesar_cipher_menu
    when '3' then stock_picker_menu
    when '4' then substrings_menu_string
    end
  end
end
