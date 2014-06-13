class Array
  def mergesort
    return self if size <= 1
    second_array = slice!((size / 2), (size - 1))
    merge(self.mergesort, second_array.mergesort)
  end

private

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
end
