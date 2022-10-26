# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best day to buy and the best day to sell.
# Days start at 0.
# stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12
# - You need to buy before you can sell
# - Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.
module StockPicker
  # Solution 1
  def stock_picker(stock_prices)
    output = []
    best_difference = 0
    stock_prices.each_with_index do |day, day_index|
      stock_prices[day_index..].each_with_index do |day2, day_index_from1|
        next if day2 <= day || best_difference > day2 - day

        best_difference = day2 - day
        output = [day_index, day_index_from1 + day_index]
      end
    end
    output
  end

  # Solution 2:
  def stock_picker2(prices)
    prices
      .each_with_index
      .map { |price, index| [price, index] }
      .combination(2)
      .map { |a, b| [a, b, b[0] - a[0]] }
      .max_by { |_, _, c| c }
      .slice(0, 2)
      .map { |a| a[1] }
  end

  # Solution 3
  def stock_picker3(prices)
    best = [0, 0]
    prices.each_with_index do |price, index|
      prices[index..].each_with_index do |price2, index2|
        best = [index, index2 + index] if price2 - price > prices[best[1]] - prices[best[0]]
      end
    end
    best
  end
end
