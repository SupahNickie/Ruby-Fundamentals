# AGE HISTOGRAM CHALLENGE FROM IVAN

array = Array.new
1250.times { array << rand(0..130) }

def age_histogram(array)
  totals = Array.new(131, 0)
  array.sort.each do |age|
    totals[age] += 1
  end
  print totals
  puts ""
end

age_histogram(array)

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

# CRACKING THE CODING INTERVIEW PROBLEMS
# ARRAYS AND STRINGS

# 1.1

def unique_string(string)
  puts string.chars.uniq == string.chars ? "unique" : "not unique"
end

unique_string("ice")
unique_string("poo")

# 1.2

def reverse_c_string(string)
  new_string = string.reverse + " "
  puts new_string
  puts new_string.chars.size
end

reverse_c_string("qwer")

# 1.3

def remove_duplicate_chars(string)
  puts string.chars.uniq!.join
end

remove_duplicate_chars("neubie")

# 1.4

def anagrams(a, b)
  a.each_with_index { |word, index| puts a[index].chars.sort == b[index].chars.sort ? "1" : "0" }
end

anagrams(["iceman", "carebear", "tuesq"], ["cinema", "subpoena", "quest"])

# 1.5

def replace_spaces_with_percenttwenty(string)
  puts string.gsub(" ", "%20")
end

replace_spaces_with_percenttwenty("I have to pewp")


# BIT MANIPULATION

# 5.1

def number_substring_madness(n, m, pos1, pos2)
  new_n = n.to_s.chars
  new_n[pos1, pos2] = m.to_s.chars
  puts new_n.join
end

number_substring_madness(999_999_999, 3434, 2, 6)

# 5.6

def swap_even_odds(int)
  array = int.to_s.chars
  array.each_with_index do |number, index|
    if index % 2 == 0
      array[index], array[index + 1] = array[index + 1], array[index]
    end
  end
  puts array.join
end

swap_even_odds(4234052123450)

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

# SORTING AND SEARCHING

# 9.1

def two_sorted(a, b)
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

print two_sorted([4, 10, 13, 24], [5, 16, 90])
puts ""
