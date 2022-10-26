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
