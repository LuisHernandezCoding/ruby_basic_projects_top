# frozen_string_literal: true

# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best day to buy and the best day to sell.
# Days start at 0.
# stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12
# - You need to buy before you can sell
# - Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.
#
# Solution 1
#
def stock_picker(stock_prices)
  output = []
  best_difference = 0
  stock_prices.each_with_index{ |day, day_index|
    stock_prices[day_index..].each_with_index{ |day2, day_index_from1|
      next if day2 <= day || best_difference > day2 - day

      best_difference = day2 - day
      output = [day_index, day_index_from1 + day_index]
    }
  }
  output
end

#
# Solution 2:
#
def stock_picker2(prices)
  prices.each_with_index.map { |price, index| [price, index] }
        .combination(2)
        .map { |a, b| [a, b, b[0] - a[0]] }
        .max_by { |a, b, c| c }
        .slice(0, 2)
        .map { |a| a[1] }
end

#
# Solution 3
#
def stock_picker3(prices)
  best = [0, 0]
  prices.each_with_index do |price, index|
    prices[index..].each_with_index do |price2, index2|
      best = [index, index2 + index] if price2 - price > prices[best[1]] - prices[best[0]]
    end
  end
  best
end

# ask user if run a generic test
p 'Do you want to run a generic test or a custom test?'
p 'Enter 1 for generic test or 2 for custom test'
best_days = []
stock_prices = []
case gets.chop
when '1'
  stock_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
when '2'
  p 'Enter the stock prices separated by space'
  stock_prices = gets.chop.split(' ').map(&:to_i)
else
  p 'Invalid input'
end

# ask user what solution to run
p 'Which solution do you want to run?'
p 'Enter 1, 2 or 3'
case gets.chop
when '1'
  best_days = stock_picker(stock_prices)
when '2'
  best_days = stock_picker2(stock_prices)
when '3'
  best_days = stock_picker3(stock_prices)
else
  p 'Invalid input'
end

p "input: #{stock_prices} output: #{best_days}"
p 'Best days to buy and sell:'
p "Best day to buy is the #{best_days[0] + 1}th day and best day to sell is the #{best_days[1] + 1}th day"
p "with a profit of $#{stock_prices[best_days[1]] - stock_prices[best_days[0]]}"
p "buying at $#{stock_prices[best_days[0]]} and selling at $#{stock_prices[best_days[1]]}"
