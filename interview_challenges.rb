# EASIER MEMOIZATION TECHNIQUE, @STORAGE INITIALIZED TO SHOW LACK OF MEMOIZATION

class Calculator
  attr_accessor :memo, :storage
  def initialize
    @storage = Array.new
    @memo = Hash.new
  end

  def expensive_calc_one
    if @memo[__callee__]
      return @memo[__callee__]
    else
      # Expensive calculation
      result = 2 + 2
      @storage << result
      @memo[__callee__] = result
    end
  end

  def expensive_calc_two
    # Expensive calculation
    result = 2 + 3
    @storage << result
    return result
  end
end

calc = Calculator.new
puts calc.memo
puts calc.expensive_calc_one
puts calc.expensive_calc_one
puts calc.expensive_calc_one
puts calc.expensive_calc_one
puts calc.expensive_calc_one
puts calc.memo
puts calc.expensive_calc_two
puts calc.expensive_calc_two
puts calc.expensive_calc_two
puts calc.expensive_calc_two
puts calc.memo
print "#{calc.storage}\n"

# OUTPUT:

# {}
# 4
# 4
# 4
# 4
# 4
# {:expensive_calc_one=>4}
# 5
# 5
# 5
# 5
# {:expensive_calc_one=>4}
# [4, 5, 5, 5, 5]

# CHECKS FOR SUBSEQUENCES OF 3, SUMS UP THEIR VALUES, FINDS MAXIMUM DIFFERENCE BETWEEN LOWEST
# AND HIGHEST VALUE WITHOUT OVERLAPPING SEQUENCES

array = Array.new
50.times { array << rand(-100..100) }

def maximum_difference(array)
  sequences = Array.new
  counter = 0
  until counter == array.size-2
    sequences << array[counter..counter+2]
    counter += 1
  end
  reductions = sequences.collect { |x| x.reduce(:+) }
  check_for_overlap(reductions)
end

def check_for_overlap(array)
  sorted = array.sort
  if array.size < 5
    "The maximum difference cannot be achieved without overlap"
  elsif (array.index(array.min) - array.index(array.max)).abs > 2
    (array.min - array.max).abs
  elsif (sorted[0] - sorted[1]).abs <= (sorted[-1] - sorted[-2]).abs
    array.delete_at(array.index(array.min))
    check_for_overlap(array)
  else
    array.delete_at(array.index(array.max))
    check_for_overlap(array)
  end
end

puts maximum_difference(array)

# INPUT: LARGE BLOB OF TEXT
# OUTPUT: SPLIT INTO PROPER SENTENCES, REMOVING SPACES AT START OF SENTENCE, ENFORCING UPCASE

text = "How did I forget to put this in the first commit?  Silly me! text is a quite important variable you know... Yep."

# NOTE IMPROPER SPACING AND CAPITALIZATION

def sentence_split(string)
  string.split(/[?!\.]\s/).each do |line|
    line[0] = "" if line.chars.first == " "
    line[0] = line[0].upcase if /[a-z]/.match(line.chars.first)
  end
end

puts sentence_split(text)

# OUTPUT:

# How did I forget to put this in the first commit
# Silly me
# Text is a quite important variable you know..
# Yep.

# ALT SPLIT PRESERVES THE PUNCTUATION MARKS, YET STILL SOLVES THE PROBLEM

def alt_split(string)
  array = string.gsub(/\.\s/, "\.\n").gsub(/\?\s/, "?\n").gsub(/!\s/, "!\n").split("\n")
  array.each do |line|
    line[0] = "" if line.chars.first == " "
    line[0] = line[0].upcase if /[a-z]/.match(line.chars.first)
  end
end

puts alt_split(text)

# OUTPUT:

# How did I forget to put this in the first commit?
# Silly me!
# Text is a quite important variable you know...
# Yep.

# SCREENING INTERVIEW QUESTION, FLATTEN ARBITRARILY NESTED ARRAYS

def flatten(array)
  a = []
  array.each do |n|
    if n.is_a? Array
      b = flatten(n)
      b.each { |x| a << x }
    else
      a << n
    end
  end
  a
end

array = [3, 5, [6, 18, [4]], [[2], [8, 10]]]
print "#{flatten(array)}\n"

# YELP INTERVIEW QUESTION FROM GLASSDOOR: PRINT ALL UPCASE, DOWNCASE PERMUTATIONS OF STRING

def upcase_downcase_perms(string)
  return [string.downcase, string.upcase] if string.size == 1
  head = string[0]
  tail = string[1..-1]
  sub = upcase_downcase_perms(tail)
  a = sub.collect { |x| head.upcase + x }
  b = sub.collect { |x| head.downcase + x }
  (a + b).uniq
end

puts upcase_downcase_perms('abcdefg')

# MICROSOFT INTERVIEW QUESTION FROM THE REQ: FIND EXTRA STRING

a = ['aardvark', 'onyx', 'zebra','dog', 'cat', 'monkey']
b = ['cat', 'dog', 'aardvark', 'zebra', 'monkey']

def find_extra_string(a, b)
  hash = Hash.new
  hash.default = 0
  a.each do |word|
    hash[word.to_sym] += 1
  end
  b.each do |word|
    hash[word.to_sym] += 1
  end
  hash.sort_by {|k, v| v }.first
end

puts find_extra_string(a, b)

# AGE HISTOGRAM CHALLENGE FROM IVAN

array = Array.new
1250.times { array << rand(0..130) }

def age_histogram(array)
  totals = Array.new(131, 0)
  array.sort.each do |age|
    totals[age] += 1
  end
  print "#{totals}\n"
end

age_histogram(array)

# BINARY SEARCH ALGORITHM

array = Array.new
999.times { array << rand(0..1000) }

def binary_search(array, value)
  index = (array.size/2).round
  first = array.slice(0, index)
  second = array.slice(index, array.size)
  if array[index] == value
    return "#{value} has been found in the array"
  elsif array[index] > value
    binary_search(first, value)
  elsif array[index] < value
    binary_search(second, value)
  else
    return "Element is not in the array!"
  end
end

array.sort!
puts binary_search(array, 634)

# A TO I METHOD (WORD TO INTEGER) FROM HACKING THE GOOGLE INTERVIEW

def atoi(word)
  results = []
  word.chars.each do |char|
    letter = change_letter(char)
    results << letter
  end
  results.each do |integer|
    print integer
  end
  puts ""
end

def change_letter(letter)
  case letter
    when "a" then 1
    when "b" then 2
    when "c" then 3
    when "d" then 4
    when "e" then 5
    when "f" then 6
    when "g" then 7
    when "h" then 8
    when "i" then 9
    when "j" then 10
    when "k" then 11
    when "l" then 12
    when "m" then 13
    when "n" then 14
    when "o" then 15
    when "p" then 16
    when "q" then 17
    when "r" then 18
    when "s" then 19
    when "t" then 20
    when "u" then 21
    when "v" then 22
    when "w" then 23
    when "x" then 24
    when "y" then 25
    when "z" then 26
  end
end

atoi("food")

# ADDING OTHER RANDOM METHODS I THOUGHT TO TRY

def factorial(n)
  (1..n).inject { |product, n| product * n }
end

puts factorial(1)
puts factorial(2)
puts factorial(3)
puts factorial(4)
puts factorial(5)
puts factorial(6)
puts factorial(7)

def shortest_word(array)
  array.inject { |memo, word| word.length < memo.length ? word : memo }
end

array = ["socks", "cinema", "stare", "cemian", "cokss", "brigade", "tares", "iceman", "time", "rbiagde", "rates", "maniec"]

puts shortest_word(array)

def reverse_string(string)
  return string if string.size == 1
  array_string = string.chars
  index1 = 0
  index2 = (array_string.size - 1)
  until index1 >= index2
    array_string[index1], array_string[index2] = array_string[index2], array_string[index1]
    index1 += 1
    index2 -= 1
  end
  return array_string.join
end

puts reverse_string("fiver")
puts reverse_string("cake")
puts reverse_string("Nicholas Case is the super best")
puts reverse_string("SOYLENT GREEN IS PEOPLE!")
puts reverse_string("I")

def check_prime(n)
  primes = [1, 2, 3, 5, 7]
  (11..n).each do |x|
    if (x % 2) != 0 && (x % 3) != 0 && (x % 5) != 0 && (x % 7) != 0
      primes << x
    end
  end
  print "#{primes}\n"
  primes.include? n
end

puts check_prime(129)

# TRAVELLING SALESMAN

include Math

class Map
  attr_accessor :cities, :temp_cities
  def initialize(cities = [], temp_cities = [])
    @cities = cities
    @temp_cities = temp_cities
  end

  def find_shortest_path(start, remaining)
    return if remaining.size == 1
    array = Array.new
    ret = Array.new
    @temp_cities = @temp_cities - [start]
    hash = Hash.new
    @temp_cities.each do |city|
      hash[city.name] = start.distance_to_another(city)
    end
    shortest = hash.sort_by{|k,v| v }.first
    index = @temp_cities.find_index {|city| city.name == shortest[0]}
    new_start = @temp_cities[index]
    @temp_cities.delete(index)
    array << new_start
    ret << shortest + [find_shortest_path(new_start, @temp_cities)]
  end

  def print_shortest_path(start, remaining)
    ret = find_shortest_path(start, remaining)
    puts ret.flatten[0..-2]
  end

end

class City
  attr_accessor :name, :x, :y, :map
  def initialize(name, x, y, map)
    @name = name
    @x = x
    @y = y
    @map = map
    @map.cities << self
    @map.temp_cities << self
  end

  def distance_to_another(city)
    a = (self.x - city.x).abs
    b = (self.y - city.y).abs
    c_squared = a**2 + b**2
    sqrt(c_squared)
  end

end

map = Map.new
city1 = City.new("alpha", 22, 5, map)
city2 = City.new("beta", 1, 3, map)
city3 = City.new("gamma", 8, 0, map)
city4 = City.new("delta", 17, 4, map)
city5 = City.new("epsilon", 13, 8, map)
city6 = City.new("phi", 14, 17, map)
city7 = City.new("zeta", 7, 2, map)

map.print_shortest_path(city7, map.cities)

# TAKE AN INPUT FILE OF COMPANY JOIN DATES, BALANCES, ID NUMBERS, AND NAMES, PARSE IT, THEN SORT

f = File.open("input.txt")
  hash = Hash.new
  File.foreach(f) do |x|
    hash[/Id: \d{1,5}/.match(x).to_s[4..-1].to_i] = /20\d\d-\d\d-\d\d/.match(x).to_s.gsub('-', '')[0..-3].to_i,
    /\D\d{1,3},\d{1,3}.\d{2}/.match(x).to_s.gsub('$', '').gsub(',', '').gsub('.', '').to_i,
    /Name: (...)[^\<]*/.match(x).to_s[6..-2]
  end
f.close

def sort_hash(hash)
  by_date = hash.sort_by{|k,v| [ v[0], -v[1], v[2] ]}
end

sorted = sort_hash(hash)

output = File.new("output.txt", "w+")

jan11 = Array.new
sorted.each { |line| jan11 << line[0].to_s if line[1][0] == 201101 }
feb11 = Array.new
sorted.each { |line| feb11 << line[0].to_s if line[1][0] == 201102 }
mar11 = Array.new
sorted.each { |line| mar11 << line[0].to_s if line[1][0] == 201103 }
april11 = Array.new
sorted.each { |line| april11 << line[0].to_s if line[1][0] == 201104 }
may11 = Array.new
sorted.each { |line| may11 << line[0].to_s if line[1][0] == 201105 }
june11 = Array.new
sorted.each { |line| june11 << line[0].to_s if line[1][0] == 201106 }
july11 = Array.new
sorted.each { |line| july11 << line[0].to_s if line[1][0] == 201107 }
august11 = Array.new
sorted.each { |line| august11 << line[0].to_s if line[1][0] == 201108 }
sept11 = Array.new
sorted.each { |line| sept11 << line[0].to_s if line[1][0] == 201109 }
oct11 = Array.new
sorted.each { |line| oct11 << line[0].to_s if line[1][0] == 201110 }
nov11 = Array.new
sorted.each { |line| nov11 << line[0].to_s if line[1][0] == 201111 }
dec11 = Array.new
sorted.each { |line| dec11 << line[0].to_s if line[1][0] == 201112 }
jan12 = Array.new
sorted.each { |line| jan12 << line[0].to_s if line[1][0] == 201201 }
feb12 = Array.new
sorted.each { |line| feb12 << line[0].to_s if line[1][0] == 201202 }
mar12 = Array.new
sorted.each { |line| mar12 << line[0].to_s if line[1][0] == 201203 }
april12 = Array.new
sorted.each { |line| april12 << line[0].to_s if line[1][0] == 201204 }
may12 = Array.new
sorted.each { |line| may12 << line[0].to_s if line[1][0] == 201205 }
june12 = Array.new
sorted.each { |line| june12 << line[0].to_s if line[1][0] == 201206 }
july12 = Array.new
sorted.each { |line| july12 << line[0].to_s if line[1][0] == 201207 }
august12 = Array.new
sorted.each { |line| august12 << line[0].to_s if line[1][0] == 201208 }
sept12 = Array.new
sorted.each { |line| sept12 << line[0].to_s if line[1][0] == 201209 }
oct12 = Array.new
sorted.each { |line| oct12 << line[0].to_s if line[1][0] == 201210 }
nov12 = Array.new
sorted.each { |line| nov12 << line[0].to_s if line[1][0] == 201211 }
dec12 = Array.new
sorted.each { |line| dec12 << line[0].to_s if line[1][0] == 201212 }
jan13 = Array.new
sorted.each { |line| jan13 << line[0].to_s if line[1][0] == 201301 }
feb13 = Array.new
sorted.each { |line| feb13 << line[0].to_s if line[1][0] == 201302 }
mar13 = Array.new
sorted.each { |line| mar13 << line[0].to_s if line[1][0] == 201303 }
april13 = Array.new
sorted.each { |line| april13 << line[0].to_s if line[1][0] == 201304 }
may13 = Array.new
sorted.each { |line| may13 << line[0].to_s if line[1][0] == 201305 }
june13 = Array.new
sorted.each { |line| june13 << line[0].to_s if line[1][0] == 201306 }
july13 = Array.new
sorted.each { |line| july13 << line[0].to_s if line[1][0] == 201307 }
august13 = Array.new
sorted.each { |line| august13 << line[0].to_s if line[1][0] == 201308 }
sept13 = Array.new
sorted.each { |line| sept13 << line[0].to_s if line[1][0] == 201309 }
oct13 = Array.new
sorted.each { |line| oct13 << line[0].to_s if line[1][0] == 201310 }
nov13 = Array.new
sorted.each { |line| nov13 << line[0].to_s if line[1][0] == 201311 }
dec13 = Array.new
sorted.each { |line| dec13 << line[0].to_s if line[1][0] == 201312 }

output.puts "January 2011: " + jan11.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "February 2011: " + feb11.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "March 2011: " + mar11.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "April 2011: " + april11.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "May 2011: " + may11.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "June 2011: " + june11.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "July 2011: " + july11.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "August 2011: " + august11.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "September 2011: " + sept11.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "October 2011: " + oct11.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "November 2011: " + nov11.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "December 2011: " + dec11.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "January 2012: " + jan12.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "February 2012: " + feb12.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "March 2012: " + mar12.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "April 2012: " + april12.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "May 2012: " + may12.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "June 2012: " + june12.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "July 2012: " + july12.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "August 2012: " + august12.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "September 2012: " + sept12.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "October 2012: " + oct12.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "November 2012: " + nov12.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "December 2012: " + dec12.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "January 2013: " + jan13.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "February 2013: " + feb13.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "March 2013: " + mar13.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "April 2013: " + april13.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "May 2013: " + may13.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "June 2013: " + june13.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "July 2013: " + july13.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "August 2013: " + august13.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "September 2013: " + sept13.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "October 2013: " + oct13.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "November 2013: " + nov13.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
output.puts "December 2013: " + dec13.to_s.gsub('[', '').gsub(']', '').gsub('"', '')
