# STANDARD FIZZBUZZ

def normal_fizzbuzz(num)
  if ((num % 5) == 0) && ((num % 3) == 0)
    "fizzbuzz"
  elsif (num % 5) == 0
    "buzz"
  elsif (num % 3) == 0
    "fizz"
  else
    num
  end
end

puts normal_fizzbuzz(15)
puts normal_fizzbuzz(10)
puts normal_fizzbuzz(3)
puts normal_fizzbuzz(4)

# fizzbuzz
# buzz
# fizz
# 4

# HARDCORE FIZZBUZZ

LIST_OF_DIVISORS = { 3 => "Fizz", 5 => "Buzz", 7 => "Sivv"}

def hardcore_fizzbuzz(*nums)
  nums.each do |num|
    puts check_divisors(num)
  end
end

def add_to_list_of_divisors(divisor, term)
  LIST_OF_DIVISORS[divisor] = term
end

def check_divisors(num)
  end_result = ""
  LIST_OF_DIVISORS.each { |divisor, term| end_result += term if (num % divisor).zero? }
  end_result.empty? ? num : end_result
end

add_to_list_of_divisors(9, "Narr")
hardcore_fizzbuzz(1, 2, 3, 4, 5, 6, 7, 15, 35, 90, 105, 945)

# 1
# 2
# Fizz
# 4
# Buzz
# Fizz
# Sivv
# FizzBuzz
# BuzzSivv
# FizzBuzzNarr
# FizzBuzzSivv
# FizzBuzzSivvNarr

# RANGED VERSION OF HARDCORE FIZZBUZZ

OTHER_LIST_OF_DIVISORS = { 3 => "Rawr", 5 => "Ghaw", 7 => "Yuiu"}

def ranged_hardcore_fizzbuzz(nums)
  nums.each do |num|
    puts check_other_list_of_divisors(num)
  end
end

def add_to_other_list_of_divisors(divisor, term)
  OTHER_LIST_OF_DIVISORS[divisor] = term
end

def check_other_list_of_divisors(num)
  end_result = ""
  OTHER_LIST_OF_DIVISORS.each { |divisor, term| end_result += term if (num % divisor).zero? }
  end_result.empty? ? num : end_result
end

add_to_other_list_of_divisors(9, "Neto")
ranged_hardcore_fizzbuzz(1200..1212)

# RawrGhaw
# 1201
# 1202
# Rawr
# Yuiu
# Ghaw
# RawrNeto
# 1207
# 1208
# Rawr
# Ghaw
# Yuiu
# Rawr
