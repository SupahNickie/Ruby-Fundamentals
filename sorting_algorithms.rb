class Array

  def insertion_sort
    (1...size).each do |n|
      value_to_insert = delete_at(n)
      insertion_index = n
      insertion_index -= 1 while insertion_index > 0 && self[insertion_index - 1] > value_to_insert
      insert(insertion_index, value_to_insert)
    end
    self
  end

  def mergesort
    return self if size <= 1
    second_array = slice!((size / 2), (size - 1))
    merge(self.mergesort, second_array.mergesort)
  end

  def quicksort(left = 0, right = (self.size - 1))
    if left < right
      pivot_index = (left + (right - left)/2)
      new_pivot_index = lock_pivot_and_partition(left, right, pivot_index)
      quicksort(left, new_pivot_index - 1)
      quicksort(new_pivot_index + 1, right)
    end
    self
  end

  def lsd_radix_sort
    array_copy = dup
    amount_of_passes = [max, min.abs].max.to_s.length
    amount_of_passes.times do |i|
      buckets = Array.new(20) { [] }
      base = 10**i
      array_copy.each do |n|
        bucket_digit = (n/base) % 10
        bucket_digit += 10 if n >= 0
        buckets[bucket_digit] << n
      end
      array_copy = buckets.flatten
    end
    array_copy
  end

private

  # MERGESORT UTILITY METHOD

  def merge(left, right)
    result = []
    until left.empty? || right.empty?
      if left.first <= right.first
        result << left.shift
      elsif right.first <= left.first
        result << right.shift
      end
    end
    result + left + right
  end

  # QUICKSORT UTILITY METHOD

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

array = Array.new
50.times { array << rand(-130..130) }
puts "INSERTION SORT IMPLEMENTATION: #{array.dup.insertion_sort.inspect}"
puts "QUICKSORT IMPLEMENTATION: #{array.dup.quicksort.inspect}"
puts "LSD RADIX SORT IMPLEMENTATION: #{array.dup.lsd_radix_sort.inspect}"
puts "MERGESORT IMPLEMENTATION: #{array.dup.mergesort.inspect}"
