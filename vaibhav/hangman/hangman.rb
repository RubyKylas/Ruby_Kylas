# hangman game

def hangman

  attempts = 6
  words = %w[vaibhav]
  char_arr = words.sample.chars
  puts "the length of your word is #{char_arr.length} and you get 6 chances\n"
  user_string = '*' * char_arr.length
  print user_string.to_s

  while attempts > 0
    break unless user_string.include?('*')

    print 'Enter your character: '
    character = gets.chomp

    if char_arr.include?(character)
      char_arr.each_with_index do |char, index|
        user_string[index] = character if char == character
      end
    else
      attempts -= 1
      puts "wrong attempted #{6 - attempts}"
    end

    print 'this is your string: ', user_string.to_s
    puts ' '
  end

  user_string.include?('*')? 'you lost the game' : 'you won the game'

end

# hangman game