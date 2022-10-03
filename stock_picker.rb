# frozen_string_literal: true

# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best day to buy and the best day to sell.
# Days start at 0.
# stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12
# - You need to buy before you can sell
# - Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.
#
# Solution 1:
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
# Solution 2
#
#
# Solution 3
#

# ask user if run a generic test
p 'Do you want to run a generic test or a custom test?'
p 'Enter 1 for generic test or 2 for custom test'
best_days = []
stock_prices = []
case gets.chop
when '1'
  stock_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
  best_days = stock_picker(stock_prices)
when '2'
  p 'Enter the stock prices separated by space'
  stock_prices = gets.chop.split(' ').map(&:to_i)
  best_days = stock_picker(stock_prices)
else
  p 'Invalid input'
end
p "Best day to buy is the #{best_days[0] + 1}th day and best day to sell is the #{best_days[1] + 1}th day"
p "with a profit of $#{stock_prices[best_days[1]] - stock_prices[best_days[0]]}"
p "buying at $#{stock_prices[best_days[0]]} and selling at $#{stock_prices[best_days[1]]}"