# method sum which takes an array of integers as an argument and 
# returns the sum of its elements. 
# For an empty array it should return zero.
def sum(arr)
  if arr.empty?
    0
  else
    arr.inject(:+)
  end
end

# method max_2_sum which takes an array of integers as an argument 
# and returns the sum of its two largest elements. For an empty 
# array it should return zero. For an array with just one element, 
# it should return that element.
def max_2_sum(int_collection)
  sum = 0
  if int_collection.empty?
    sum
  elsif int_collection.count == 1
    int_collection.first
  else
    sum = int_collection.sort[-1] + int_collection.sort[-2] 
  end
end

# method sum_to_n? which takes an array of integers and an additional 
# integer, n, as arguments and returns true if any two distinct elements 
# in the array of integers sum to n. 
# An empty array or single element array should both return false.
def sum_to_n?(arr, n)
  arr.permutation(2) do |i, j|
    if i + j == n 
       return true
    end
  end
  false
end
