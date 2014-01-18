def sort(array)
  return array if array.size <= 1
  second_array = array.slice!((array.size/2).round, array.size)

  left_sorted_array = sort(array)
  right_sorted_array = sort(second_array)

  return merge(left_sorted_array, right_sorted_array)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first <= right.first
      result << left.shift
    elsif right.first <= left.first
      result << right.shift
    end
  end

  return result + left + right
end

test = sort([4, 2, 10, 534, 16, 28, 15, 31, 250, 3, 17])
print test

# Output = [2, 3, 4, 10, 15, 16, 17, 28, 31, 250, 534]
