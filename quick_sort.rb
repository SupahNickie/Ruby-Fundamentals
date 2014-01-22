def quicksort(array, left = 0, right = (array.size - 1))
  if left < right
    pivot_index = (left + ((right - left)/2).to_i)
    new_pivot_index = partition(array, left, right, pivot_index)
    quicksort(array, left, new_pivot_index - 1)
    quicksort(array, new_pivot_index + 1, right)
  end

  return array
end

def partition(array, left, right, pivot_index)
  pivot_value = array[pivot_index]
  array[right], array[pivot_index] = array[pivot_index], array[right]
  store_index = left

  (left...right).each do |n|
    if array[n] < pivot_value
      array[n], array[store_index] = array[store_index], array[n]
      store_index += 1
    end
  end

  array[right], array[store_index] = array[store_index], array[right]
  return store_index
end

test = quicksort([435, 25, 10, 3460, 234, 656, 104, 54, 23, 54, 35])
print test

# Output = [10, 23, 25, 35, 54, 54, 104, 234, 435, 656, 3460]
