@words_list = { :apple => "A type of fruit", :dog => "A domesticated animal", :socks => "Clothing for the feet" }

def state_definition
  puts "What word are you defining?"
  @word = gets.chomp.downcase.to_sym
  puts "What's the definition of the word?"
  @definition = gets.chomp
  @words_list[@word] = @definition
end

def lookup
  puts "What word do you want to look up?"
  @word = gets.chomp.downcase.to_sym
  puts @words_list[@word]
end

def keep_program_going
  exit = false
  until exit
    puts "What action would you like to take?"
    user_desire = gets.chomp.downcase
    case user_desire
    when "state definition"
      state_definition
    when "lookup"
      lookup
    when "exit"
      exit = true
    end
  end
end

keep_program_going
