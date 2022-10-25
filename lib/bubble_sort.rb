# Class bubble_sort made to sort an array of numbers using the bubble sort methodology
# it takes an array and returns a sorted array
module BubbleSort
  # solution 1
  def bubble_sort(array)
    iterations = 0
    (array.length - 1).times do
      (array.length - 1 - iterations).times do |i|
        array[i], array[i + 1] = array[i + 1], array[i] if array[i] > array[i + 1]
      end
      iterations += 1
    end
    array
  end

  # solution 2
  def bubble_sort2(array)
    loop do
      swapped = false
      (array.length - 1).times do |i|
        if array[i] > array[i + 1]
          array[i], array[i + 1] = array[i + 1], array[i]
          swapped = true
        end
      end
      break unless swapped
    end
    array
  end

  # solution 3
  def bubble_sort3(array)
    sorted = false
    until sorted
      sorted = true
      (array.length - 1).times do |i|
        if array[i] > array[i + 1]
          array[i], array[i + 1] = array[i + 1], array[i]
          sorted = false
        end
      end
    end
    array
  end
end

# p 'Do you want to run a generic test or a custom test?'
# p 'Enter 1 for generic test or 2 for custom test'
# array = []
# case gets.chop
# when '1'
#   array = [4, 3, 78, 2, 0, 2]
# when '2'
#   p 'Enter the array of numbers separated by space'
#   array = gets.chop.split.map(&:to_i)
# end
# p 'Which solution do you want to run?'
# p 'Enter 1, 2 , 3 or all'
# case gets.chop
# when '1'
#   p bubble_sort(array)
# when '2'
#   p bubble_sort2(array)
# when '3'
#   p bubble_sort3(array)
# when 'all'
#   p bubble_sort(array)
#   p bubble_sort2(array)
#   p bubble_sort3(array)
# end
