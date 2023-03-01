SECRET_WORD = "abbbccabxc"
$guess_word = " _" * SECRET_WORD.length
$guessed_letters = Array.new
$max_chances = 6

def check_the_guess(letter)
  if letter.length == 1 && SECRET_WORD.include?(letter) && !$guessed_letters.include?(letter)
    puts "\nGood guess! You have guessed the correct letter '#{letter}'."
    $guessed_letters.push(letter)
    add_letter_to_guess_word(letter) 
  else
    puts "\nSorry, You have guessed the wrong letter '#{letter}'."
    $max_chances -= 1
  end
  return $guess_word
end

def game_is_over_or_not?
  $max_chances == 0 || $guess_word.include?('_') == false
end

def add_letter_to_guess_word(letter)
  SECRET_WORD.chars.each_with_index {|ch, id| $guess_word[2 * id + 1] = letter if ch == letter}
  return $guess_word
end

def win?
  print "\nCongratulations! You guessed the correct word '#{SECRET_WORD}'!\n" if $guess_word.include?('_') == false
  print "\nSorry, you ran out of guesses. The word was '#{SECRET_WORD}'.\n" if $max_chances == 0
end

def hangman_game()
  puts "Welcome to Hangman! The word has #{SECRET_WORD.length} letters."
  while not game_is_over_or_not?
    puts "\nChances left: #{$max_chances}\n"
    print "\nEnter a letter: "
    letter = gets.chomp.downcase.strip
    puts "\n#{check_the_guess(letter)}\n"
  end 
  win?
end

