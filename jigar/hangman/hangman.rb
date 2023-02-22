$secret_word = "aaabbbcccc"
$word = $secret_word.split("")
$guess_word = " _" * $word.length
$max_chances = 6
$correct_guesses = 0

def check_the_guess(letter)
  id = -1
  if $word.include?(letter)
    $word[id = $word.index(letter)] = "#"
    puts "\nGood guess! You have guessed the correct letter '#{letter}'."
    $correct_guesses += 1
  else
    puts "\nSorry, You have guessed the wrong letter '#{letter}'."
    $max_chances -= 1
  end
  add_letter_to_guess_word(id, letter) 
end

def game_is_over_or_not?
  $max_chances == 0 || $correct_guesses == $word.length
end

def add_letter_to_guess_word(id, letter)
  $guess_word[2 * id + 1] = letter if id >= 0
  return $guess_word
end

def win?
  print "\nCongratulations! You guessed the correct word '#{$secret_word}'!\n" if $correct_guesses == $word.length
  print "\nSorry, you ran out of guesses. The word was '#{$secret_word}'.\n" if $max_chances == 0
end

def hangman_game()
  puts "Welcome to Hangman! The word has #{$word.length} letters."
  while not game_is_over_or_not?
    puts "\nChances left: #{$max_chances}\n"
    print "\nEnter a letter: "
    letter = gets.chomp.downcase.strip
    puts "\n#{check_the_guess(letter)}\n"
  end 
  win?
end

# hangman_game
