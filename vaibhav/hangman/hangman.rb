#hangman game

def hangman
    attempts = 6
    words = %w[vaibhav]
    charArr = words.sample.chars
    puts "the length of your word is #{charArr.length} and you get 6 chances\n"
    userString = '*' * charArr.length
    print userString.to_s
  
    while attempts > 0
        break unless userString.include?('*')
  
       print 'Enter your character: '
        character = gets.chomp
  
        if charArr.include?(character)
          charArr.each_with_index do |char, index|
            userString[index] = character if char == character
          end
  
        else
          attempts -= 1
          puts "wrong attempted #{6 - attempts}"
        end
  
        print 'this is your string: ', userString.to_s
        puts " "
    end
  
    if userString.include?('*')
      return "you lost the game"
    else
      return "you won the game"
    end
  
  end

#hangman game