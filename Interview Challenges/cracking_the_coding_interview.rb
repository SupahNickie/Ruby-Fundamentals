# CRACKING THE CODING INTERVIEW PROBLEMS
# ARRAYS AND STRINGS

# 1.1

def unique_string(string)
  string.chars.uniq == string.chars ? "unique" : "not unique"
end

print "#{unique_string('ice')}\n"
print "#{unique_string('poo')}\n"

# 1.2

def reverse_c_string(string)
  new_string = string.reverse + " "
  puts new_string
  puts new_string.chars.size
end

reverse_c_string("qwer")

# 1.3

def remove_duplicate_chars(string)
  string.chars.uniq!.join
end

print "#{remove_duplicate_chars('neubie')}\n"

# 1.4

def anagrams(a, b)
  a.each_with_index { |word, index| puts a[index].chars.sort == b[index].chars.sort ? "1" : "0" }
end

anagrams(['iceman', 'carebear', 'tuesq'], ['cinema', 'subpoena', 'quest'])

# 1.5

def replace_spaces_with_percenttwenty(string)
  string.gsub(" ", "%20")
end

print "#{replace_spaces_with_percenttwenty('I have to pewp')}\n"

# SOME MORE STRING UTILITIES

class String
  def balanced?
    counter = 0
    self.chars.each do |char|
      if char == "("
        counter += 1
      elsif char == ")"
        counter -= 1
      end
      return "Invalid closing parentheses" if counter < 0
    end
    counter.zero? ? "Balanced" : "Invalid amounts of opening parantheses"
  end
end

# FOR THE DATA STRUCTURES CHAPTERS, PLEASE LOOK AT DATA_STRUCTURES.RB IN THIS REPOSITORY

# BIT MANIPULATION

# 5.1

def number_substring_madness(n, m, pos1, pos2)
  new_n = n.to_s.chars
  new_n[pos1, pos2] = m.to_s.chars
  new_n.join
end

print "#{number_substring_madness(999_999_999, 3434, 2, 6)}\n"

# 5.6

def swap_even_odds(int)
  array = int.to_s.chars
  array.each_with_index do |number, index|
    if index % 2 == 0
      array[index], array[index + 1] = array[index + 1], array[index]
    end
  end
  array.join
end

print "#{swap_even_odds(4234052123450)}\n"

# BRAIN TEASERS

# 6.1

"3 1 3 6 = 8
(3+1)/(3/6) = 8"

# 6.3

"5 gallons and 3 gallons = 4 gallons

5 > 3, dump 3 gallons out
5(2 inside) > 3; 5 is empty, 3 gallon has 2 inside
5(fill up) > 3(2 inside); 5 gallons has 4 gallons inside"

# 6.5

"Drop the egg from the 10th floor, then the 20th floor and so on until it breaks, which will leave you with 9 additional floors to try.
The most amount of drops in the worst case scenario is on the 99th floor, which is 10 drops plus 9 more to find the individual floor."

# OBJECT ORIENTED DESIGN

# 7.1

SUITS = ["spades", "hearts", "clubs", "diamonds"]
NUMBERS = ["ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "queen", "king"]

class Deck
  attr_accessor :game, :cards
  def initialize(game, cards = [])
    @game = game
    @cards = cards
    if @game == "poker"
      SUITS.each do |suit|
        NUMBERS.each do |number|
          Card.new(suit, number).add_to_deck(self)
        end
      end
    elsif @game == "pinochle"
      SUITS.each do |suit|
        NUMBERS.each do |number|
          if number.is_a? String
            2.times { Card.new(suit, number).add_to_deck(self) }
          elsif (number.is_a? Fixnum) && (number > 8)
            2.times { Card.new(suit, number).add_to_deck(self) }
          end
        end
      end
    end
  end

  def list_cards
    self.cards.each do |card|
      card.list
    end
  end

  def shuffle(times_to_shuf)
    times_to_shuf.times { self.cards.shuffle! }
  end
end

class Card
  attr_accessor :suit, :value
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def list
    print "#{self.value} of #{self.suit}"
    puts ""
  end

  def add_to_deck(deck)
    deck.cards << self
  end
end

deck1 = Deck.new("poker")
deck2 = Deck.new("pinochle")
deck1.list_cards
deck2.shuffle(3)
deck2.list_cards

# 7.2

class Office
  attr_accessor :freshers, :tl, :pm, :employees
  def initialize(tl, pm, freshers = [])
    @freshers = freshers
    @tl = tl
    @pm = pm
    @employees = [@freshers, @tl, @pm]
  end

  def add_fresher_to_office(name)
    Employee.new("freshers", name).assign_fresher_to_office(self)
  end
end

class Employee
  attr_accessor :type, :name, :engaged
  def initialize(type, name, engaged = false)
    @type = type
    @name = name
    @engaged = engaged
  end

  def assign_fresher_to_office(office)
    office.freshers << self
  end
end

class Call
  attr_accessor :subject, :handler
  def initialize(subject, handler = nil)
    @subject = subject
    @handler = handler
  end

  def get_call_handler(office)
    office.employees.flatten.each do |employee|
      if employee.engaged == false
        if employee.type == "freshers"
          @handler = employee.name
          break
        elsif employee.type == "tl"
          @handler = employee.name
          break
        else # employee.type == "pm"
          @handler = employee.name
        end
      else
        @handler = "on hold"
      end
    end
  end
end

bill = Employee.new("tech lead", "Bill")
steve = Employee.new("project manager", "Steve")
joe = Employee.new("freshers", "Joe", true)
office = Office.new(bill, steve)
joe.assign_fresher_to_office(office)
office.add_fresher_to_office("Stewart")
office.employees.flatten.collect { |employee| puts employee.name }
test_call = Call.new("tech support")
test_call.get_call_handler(office)
puts test_call.handler

# 7.3

class Jukebox
  attr_accessor :songs
  def initialize(songs = [])
    @songs = songs
  end

  def list_songs
    @songs.each do |song|
      puts "#{song.name} by #{song.artist}"
    end
  end
end

class Song
  attr_accessor :name, :artist
  def initialize(name, artist)
    @name = name
    @artist = artist
  end

  def add_to_jukebox(jukebox)
    jukebox.songs << self
  end
end

jukebox = Jukebox.new
song = Song.new("One", "Metallica")
song.add_to_jukebox(jukebox)
Song.new("Slickleg", "Mastodon").add_to_jukebox(jukebox)
jukebox.list_songs

# 7.8

class Piece
  attr_accessor :starting_color, :current_color, :top, :bottom, :left, :right
  def initialize(starting_color, current_color, top = false, bottom = false, left = false, right = false)
    @starting_color = starting_color
    @current_color = current_color
    @top = top
    @bottom = bottom
    @left = left
    @right = right
  end

  def check_color
    if (top && bottom) || (left && right)
      if @starting_color == "white"
        @current_color = "black"
      else
        @current_color = "white"
      end
    end
  end
end

# RECURSION

# 8.1

def nth_iterative_fibonacci(n)
  start = 0
  iter_start = 1
  sum = 0
  (n - 1).times do
    sum = start + iter_start
    start = iter_start
    iter_start = sum
  end
  return sum
end

puts nth_iterative_fibonacci(5)
puts nth_iterative_fibonacci(20)

def nth_recursive_fibonacci(n)
  return 0 if n == 0
  return 1 if n == 1
  nth_recursive_fibonacci(n - 1) + nth_recursive_fibonacci(n - 2)
end

puts nth_recursive_fibonacci(5)
puts nth_recursive_fibonacci(20)

MEMO = Hash.new

def golf_style_memoized_fibonacci(n)
  n < 2 ? n : MEMO.has_key?(n) ? MEMO[n] : MEMO[n] = golf_style_memoized_fibonacci(n-1) + golf_style_memoized_fibonacci(n-2)
end

puts golf_style_memoized_fibonacci(5)
puts golf_style_memoized_fibonacci(20)

def best_fibonacci_ever(n)
  n < 2 ? n : (2..n).inject([0, 1]) {|a, i| a << a[i - 1] + a[i - 2]}[n]
end

puts best_fibonacci_ever(5)
puts best_fibonacci_ever(20)

# 8.4

def permutations(string)
  return [string] if string.size == 1
  array = Array.new
  (0..(string.size - 1)).each do |n|
    rest = string.chars
    picked = rest.delete_at(n)
    permutations(rest.join).each { |x| array << picked + x }
  end
  array
end

puts permutations("cute")

# SORTING AND SEARCHING

# 9.1

def two_sorted_a(a, b)
  counter = 0
  until b.empty?
    if b.first > a.last
      a.insert(-1, b.dup)
      b.clear
    else
      a.insert(counter, b.shift) if a[counter] > b.first
      counter += 1
    end
  end
  a.flatten!
end

def two_sorted_b(a, b)
  a.each_with_index do |num, index|
    unless b.empty?
      if b.first < num
        a.insert(index, b.shift)
      elsif b.first > a.last
        a << b.shift
      end
    end
  end
  return a
end

print "#{two_sorted_a([4, 10, 13, 24], [5, 16, 90])}\n"
print "#{two_sorted_b([4, 10, 13, 24], [5, 16, 90])}\n"

# 9.2

# O(n^2) RUNTIME, ONE ITERATION OF ARRAY PER WORD

array = ["socks", "cinema", "stare", "cemian", "cokss", "brigade", "tares", "iceman", "time", "rbiagde", "rates", "maniec"]

def anagram_sort(array)
  new_array = Array.new
  array.each do |word|
    index = 0
    while index < array.size
      comparator = array[index]
      if (word != comparator) && (word.chars.sort == comparator.chars.sort)
        new_array << comparator
        array.delete(comparator)
      end
      index += 1
    end
    new_array << word
    array.delete(word)
  end
  return new_array + array
end

puts anagram_sort(array)

# O(n) RUNTIME, ONE ITERATION THROUGH ARRAY

array = ["socks", "cinema", "stare", "cemian", "cokss", "brigade", "tares", "iceman", "time", "rbiagde", "rates", "maniec"]

def better_anagram_sort(array)
  hash = {}
  array.each do |string|
    sorted = string.chars.sort.join.to_sym
    if hash[sorted].nil?
      hash[sorted] = [string]
    else
      hash[sorted] << string
    end
  end
  hash.values.flatten
end

print "#{better_anagram_sort(array)}\n"

# CLEANER IMPLEMENTATION

def best_anagram_sort(array)
  hash = Hash.new { |hash, key| hash[key] = [] }
  array.each { |string| hash[string.chars.sort.join.to_sym] << string }
  hash.values.flatten
end

print "#{best_anagram_sort(array)}\n"
