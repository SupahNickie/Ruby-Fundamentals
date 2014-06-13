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
end
