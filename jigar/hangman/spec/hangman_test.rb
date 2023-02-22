require '/home/dell/Documents/ruby/hangman/hangman'

describe "Hangman Game: " do
  before do
    $secret_word = "aaabbbcccc"
    $word = $secret_word.split("")
    $guess_word = " _" * $word.length
    $max_chances = 6
    $correct_guesses = 0
  end
  describe "Testing of check_the_guess(letter) => " do
    context "when user guessed the correct letter" do
      it "then it should return the updated state of guess word" do
        expect{check_the_guess("a")}.to output("\nGood guess! You have guessed the correct letter 'a'.\n").to_stdout
        expect($guess_word).to eq(" a _ _ _ _ _ _ _ _ _")
      end

      it "then it should increase the correct guesses" do
        expect{check_the_guess("a")}.to output("\nGood guess! You have guessed the correct letter 'a'.\n").to_stdout
        expect($correct_guesses).to eq(1)
      end

      it "then it should not reduce the maximum chances" do
        expect{check_the_guess("a")}.to output("\nGood guess! You have guessed the correct letter 'a'.\n").to_stdout
        expect($max_chances).to eq(6)
      end
    end

    context "when user guessed the wrong letter" do
      it "then it should not change the state of guess word" do
        expect{check_the_guess("o")}.to output("\nSorry, You have guessed the wrong letter 'o'.\n").to_stdout
        expect($guess_word).to eq(" _ _ _ _ _ _ _ _ _ _")
      end

      it "then it should not increase the correct guesses" do
        expect{check_the_guess("o")}.to output("\nSorry, You have guessed the wrong letter 'o'.\n").to_stdout
        expect($correct_guesses).to eq(0)
      end

      it "then it should reduce the maximum chances" do
        expect{check_the_guess("o")}.to output("\nSorry, You have guessed the wrong letter 'o'.\n").to_stdout
        expect($max_chances).to eq(5)
      end
    end
  end

  describe "Testing of game_is_over_or_not? and win? => " do
    
    context "when the game is not over yet" do
      it "then game_is_over_or_not? should return false" do
        expect(game_is_over_or_not?).to be false
      end
    end

    context "when the game is over and has won by player" do
      it "then game_is_over_or_not? should return true and win? should print the winning message" do
        
        $secret_word.chars.each {|letter| expect{check_the_guess(letter)}.to output("\nGood guess! You have guessed the correct letter '#{letter}'.\n").to_stdout}

        expect(game_is_over_or_not?).to be true
        expect{ win? }.to output("\nCongratulations! You guessed the correct word '#{$secret_word}'!\n").to_stdout
      end
    end

    context "when the game is over and has lost by player" do
      it "then game_is_over_or_not? should return true and win? should print the losing message" do
        
        $max_chances.times {expect{check_the_guess("x")}.to output("\nSorry, You have guessed the wrong letter 'x'.\n").to_stdout}

        expect(game_is_over_or_not?).to be true
        expect{ win? }.to output("\nSorry, you ran out of guesses. The word was '#{$secret_word}'.\n").to_stdout
      end
    end
  end
end
