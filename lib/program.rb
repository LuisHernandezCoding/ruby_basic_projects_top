# Requiring the files with the methods to be used (logic)
require_relative '../lib/bubble_sort.rb'
require_relative '../lib/caesar_cipher.rb'
require_relative '../lib/stock_picker.rb'
require_relative '../lib/sub_strings.rb'
# Requiring libraries with colors and console printing
require_relative '../lib/colors.rb'
require_relative '../lib/console_printer.rb'

class Program
  include ConsolePrinter

  def initialize
    @program = true
    @program_options = {
      '1' => :bubble_sort,
      '2' => :caesar_cipher,
      '3' => :stock_picker,
      '4' => :sub_strings,
      '5' => :exit
    }
  end

  def run
    system('clear') or system('cls')
    print_message(['', 'Welcome to the Ruby Basic Projects', 'Made For TOP', ''], 72, 'bg_blue', 'bg_black', use_frame: true)
  end
end