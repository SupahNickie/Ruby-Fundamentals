class Array
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
end
