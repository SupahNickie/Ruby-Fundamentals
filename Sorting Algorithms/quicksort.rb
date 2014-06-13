class Array
  def quicksort(left = 0, right = (self.size - 1))
    if left < right
      pivot_index = (left + (right - left)/2)
      new_pivot_index = lock_pivot_and_partition(left, right, pivot_index)
      quicksort(left, new_pivot_index - 1)
      quicksort(new_pivot_index + 1, right)
    end
    self
  end

private

  def lock_pivot_and_partition(left, right, pivot_index)
    pivot_value = self[pivot_index]
    self[right], self[pivot_index] = self[pivot_index], self[right]
    store_index = left
    (left...right).each do |n|
      if self[n] < pivot_value
        self[n], self[store_index] = self[store_index], self[n]
        store_index += 1
      end
    end
    self[right], self[store_index] = self[store_index], self[right]
    store_index
  end
end
