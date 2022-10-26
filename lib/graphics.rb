require_relative 'colors'

module Graphics
  def getting_title
    title = []
    title << ' _____       _             ____            _      '
    title << '|  __ \     | |           |  _ \          (_)     '
    title << '| |__) |   _| |__  _   _  | |_) | __ _ ___ _  ___ '
    title << '|  _  / | | | \'_ \| | | | |  _ < / _` / __| |/ __|'
    title << '| | \ \ |_| | |_) | |_| | | |_) | (_| \__ \ | (__ '
    title << '|_|__\_\__,_|_.__/ \__, | |____/ \__,_|___/_|\___|'
    title << '|  __ \         (_) __/ |   | |            |__ \  '
    title << '| |__) | __ ___  _ |___/ ___| |_ ___  __   __ ) | '
    title << '|  ___/ \'__/ _ \| |/ _ \/ __| __/ __| \ \ / // /  '
    title << '| |   | | | (_) | |  __/ (__| |_\__ \  \ V // /_  '
    title << '|_|   |_|  \___/| |\___|\___|\__|___/   \_/|____| '
    title << '              _/ |  BY: @luishernandezcoding      '
    title << '             |__/                                 '
    title
  end

  def getting_bubble_sort_title
    title = []
    title << ' ____        _     _     _      '
    title << '| __ ) _   _| |__ | |__ | | ___ '
    title << '|  _ \| | | | \'_ \| \'_ \| |/ _ \\'
    title << '| |_) | |_| | |_) | |_) | |  __/'
    title << '|____/_\__,_|_.__/|_.__/|_|\___|'
    title << '     / ___|  ___  _ __| |_      '
    title << '     \___ \ / _ \| \'__| __|     '
    title << '      ___) | (_) | |  | |_      '
    title << '     |____/ \___/|_|   \__|     '
    title << '        BY: @luishernandezcoding'
    title << '                                '
    title
  end

  def getting_caesar_cipher_title
    title = []
    title << '  ____                           '
    title << ' / ___|__ _  ___  ___  __ _ _ __ '
    title << '| |   / _` |/ _ \/ __|/ _` | \'__|'
    title << '| |__| (_| |  __/\__ \ (_| | |   '
    title << ' \____\__,_|\___||___/\__,_|_|   '
    title << '  / ___(_)_ __ | |__   ___ _ __  '
    title << ' | |   | | \'_ \| \'_ \ / _ \ \'__| '
    title << ' | |___| | |_) | | | |  __/ |    '
    title << '  \____|_| .__/|_| |_|\___|_|    '
    title << '      BY:|_| @luishernandezcoding'
    title << '                                 '
    title
  end

  def getting_stock_picker_title
    title = []
    title << ' ____  _             _      '
    title << '/ ___|| |_ ___   ___| | __  '
    title << '\___ \| __/ _ \ / __| |/ /  '
    title << ' ___) | || (_) | (__|   <   '
    title << '|____/ \__\___/ \___|_|\_\  '
    title << '|  _ \(_) ___| | _____ _ __ '
    title << '| |_) | |/ __| |/ / _ \ \'__|'
    title << '|  __/| | (__|   <  __/ |   '
    title << '|_|   |_|\___|_|\_\___|_|   '
    title << '    BY: @luishernandezcoding'
    title << '                            '
    title
  end

  def getting_substrings_title
    title = []
    title << '     ____  _   _ ____              '
    title << '    / ___|| | | | __ )             '
    title << '    \___ \| | | |  _ \             '
    title << '     ___) | |_| | |_) |            '
    title << ' ____|____/\___/|____/             '
    title << '/ ___|| |_ _ __(_)_ __   __ _ ___  '
    title << '\___ \| __| \'__| | \'_ \ / _` / __| '
    title << ' ___) | |_| |  | | | | | (_| \__ \ '
    title << '|____/ \__|_|  |_|_| |_|\__, |___/ '
    title << 'BY: @luishernandezcoding|___/      '
    title << '                                   '
    title
  end

  def getting_menu_block(title, options, max_size = 23)
    block = []
    block << "   ╔#{'═' * (max_size - 5)}╗ "
    block << "   ║#{title.center(max_size - 5)}║ "
    block << "   ╚╦#{'═' * (max_size - 7)}╦╝ "
    options.each_with_index do |option, index|
      block << "    ║#{index + 1}. #{option.center(max_size - 10)}║ "
      block << "    ╠#{'═' * (max_size - 7)}╣ " unless index == options.length - 1
      block << "    ╚#{'═' * (max_size - 7)}╝ " if index == options.length - 1
    end
    block
  end
end
