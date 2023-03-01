class Hangman
  attr_reader :secret_word, :guess_word, :guessed_letters, :max_chances
  def initialize(secret_word)
    @secret_word = secret_word
    @guess_word = " _" * @secret_word.length
    @guessed_letters = Array.new
    @max_chances = 6
  end

  def check_the_guess(letter)
    if letter.length == 1 && @secret_word.include?(letter) && !@guessed_letters.include?(letter)
      puts "\nGood guess! You have guessed the correct letter '#{letter}'."
      @guessed_letters.push(letter)
      add_letter_to_guess_word(letter) 
    else
      puts "\nSorry, You have guessed the wrong letter '#{letter}'."
      @max_chances -= 1
    end
    return @guess_word
  end
  
  def game_is_over_or_not?
    @max_chances == 0 || @guess_word.include?('_') == false
  end
  
  def add_letter_to_guess_word(letter)
    @secret_word.chars.each_with_index {|ch, id| @guess_word[2 * id + 1] = letter if ch == letter}
    return @guess_word
  end
  
  def win?
    print "\nCongratulations! You guessed the correct word '#{@secret_word}'!\n" if @guess_word.include?('_') == false
    print "\nSorry, you ran out of guesses. The word was '#{@secret_word}'.\n" if @max_chances == 0
  end
  
  def hangman_game()
    puts "Welcome to Hangman! The word has #{@secret_word.length} letters."
    while not game_is_over_or_not?
      puts "\nChances left: #{@max_chances}\n"
      print "\nEnter a letter: "
      letter = gets.chomp.downcase.strip
      puts "\n#{check_the_guess(letter)}\n"
    end 
    win?
  end
end

