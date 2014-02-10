# A TO I METHOD (WORD TO INTEGER)

def atoi(word)
  results = []
  word.chars.each do |char|
    letter = change_letter(char)
    results << letter
  end
  results.each do |integer|
    print integer
  end
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
