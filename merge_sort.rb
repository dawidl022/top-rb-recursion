# Naive merge sort algorithm that makes multiple copies of the array during
# execution

def merge(left_array, right_array)
  left_index = 0
  right_index = 0
  result = []

  while left_index < left_array.length && right_index < right_array.length
    if left_array[left_index] <= right_array[right_index]
      result << left_array[left_index]
      left_index += 1
    else
      result << right_array[right_index]
      right_index += 1
    end
  end

  result += left_array[left_index..]
  result += right_array[right_index..]

  result
end

def sort(array)
  return array if array.length <= 1

  mid = array.length / 2
  left_array = array[0...mid]
  right_array = array[mid..]

  merge(sort(left_array), sort(right_array))
end
