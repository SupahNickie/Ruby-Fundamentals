LIST_OF_DIVISORS = [3, 5, 7, 9]
LIST_OF_TERMS = { 3 => "Fizz", 5 => "Buzz", 7 => "Sivv", 9 => "Narr" }

  def fizzbuzz(*nums)
    nums.each do |num|
      fizz_check = check_divisors(num)
      puts fizz_check
    end
  end

  def check_divisors(num)
    end_result = ""
    LIST_OF_DIVISORS.each do |divisor|
      result = num % divisor
      if result == 0
        end_result += LIST_OF_TERMS[divisor]
      end
    end
    if end_result.empty?
      return num
    else
      return end_result
    end
  end

fizzbuzz(1, 2, 3, 4, 5, 6, 7, 15, 35, 90, 105, 945)

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
