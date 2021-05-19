# Importing the unit test library
require "test/unit/assertions"
include Test::Unit::Assertions

# [Array-of Numbers] -> [Array-of Numbers]
# Consumes an array and returns a sorted array sorted by merge sort method.
def merge_sort(input_array)
  array_length = input_array.length
  if array_length <= 1
    input_array
  else
    left_side = merge_sort(input_array.slice(0, (array_length/2.0).round))
    right_side = merge_sort(input_array.slice((array_length/2.0).round, array_length))
    merge_halves(left_side, right_side)
  end
end

# [Array-of Numbers] [Array-of Numbers] -> [Array-of Numbers]
# Consumes two sorted arrays and returns a merged sorted array.
def merge_halves(left_array, right_array)
  result_array = []
  array_length = left_array.length + right_array.length
  array_length.times do
    if left_array[0].nil?
      result_array.push(right_array.slice!(0))
    elsif right_array[0].nil?
      result_array.push(left_array.slice!(0))
    elsif left_array[0] < right_array[0]
      result_array.push(left_array.slice!(0))
    else
      result_array.push(right_array.slice!(0))
    end
  end
  result_array
end

assert_equal merge_halves([1, 3, 5], [2, 4, 6]), [1, 2, 3, 4, 5, 6]
assert_equal merge_sort([5, 3, 2, 10]), [2, 3, 5, 10]
assert_equal merge_sort([1, 2, 3, 4, 11, 14, 5, 3, 2, 10]), [1, 2, 2, 3, 3, 4, 5, 10, 11, 14]