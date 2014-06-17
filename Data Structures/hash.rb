class MyHash
  attr_accessor :pairs
  def initialize(pairs = 1024)
    @pairs = Array.new(pairs){[]}
  end

  def get(key)
    @pairs[hash(key)].each { |array| return array[1] if array[0] == key }
  end

  def set(key, value)
    done = false
    @pairs[hash(key)].each do |array|
      if key == array[0]
        array[1] = value
        done = true
      end
    end
    @pairs[hash(key)] << [key, value] unless done == true
  end

private

  def hash(key)
    key.chars.map(&:ord).reduce(:+) % @pairs.size
  end
end

my_hash = MyHash.new(6) # Ensure a collision to show handling
my_hash.set("cute", 32)
puts my_hash.pairs.inspect
my_hash.set("garwr", 37)
puts my_hash.pairs.inspect
my_hash.set("gwrar", "asdfasdf")
puts my_hash.pairs.inspect
my_hash.set("grawr", 39)
puts my_hash.pairs.inspect
my_hash.set("grawr", Array.new )
puts my_hash.pairs.inspect
my_hash.set("pop", 48)
puts my_hash.pairs.inspect
my_hash.set("fur", 24)
puts my_hash.pairs.inspect
puts "THIS IS THE GET FOR FUR #{my_hash.get("fur")}"
puts "THIS IS THE GET FOR CUTE #{my_hash.get("cute")}"
puts "THIS IS THE GET FOR GRAWR #{my_hash.get("grawr")}"
