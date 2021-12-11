# Efficient merge sort algorithm that uses indexes and only 1 extra array

def merge(array, start, mid, stop, spare)
  left_index = start
  right_index = mid + 1
  current_index = start

  spare = array.clone

  while left_index <= mid && right_index <= stop

    if spare[left_index] <= spare[right_index]
      array[current_index] = spare[left_index]
      left_index += 1
    else
      array[current_index] = spare[right_index]
      right_index += 1
    end

    current_index += 1
  end

  while left_index <= mid
    array[current_index] = spare[left_index]

    left_index += 1
    current_index += 1
  end

  array
end

def merge_sort(array, start, stop, spare = [])
  return if start >= stop

  mid = (start + stop) / 2

  merge_sort(array, start, mid, spare)
  merge_sort(array, mid + 1, stop, spare)

  merge(array, start, mid, stop, spare)
end

def sort(array)
  merge_sort(array.clone, 0, array.length - 1)
end
