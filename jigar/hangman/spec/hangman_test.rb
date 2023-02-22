require '/home/dell/ruby_Kylas/jigar/hangman/hangman'

describe "Hangman Game: " do
  before(:each) do
    $word = SECRET_WORD.clone
    $guess_word = " _" * $word.length
    $max_chances = 6
    $correct_guesses = 0
  end
  describe "Testing of check_the_guess(letter) => " do
    context "when user guessed the correct letter" do
      it "then it should return the updated state of guess word" do
        check_the_guess("a")
        expect($guess_word).to eq(" a _ _ _ _ _ _ _ _ _")
      end

      it "then it should increase the correct guesses" do
        check_the_guess("a")
        expect($correct_guesses).to eq(1)
      end

      it "then it should not reduce the maximum chances" do
        check_the_guess("a")
        expect($max_chances).to eq(6)
      end
    end

    context "when user guessed the wrong letter" do
      it "then it should not change the state of guess word" do
        check_the_guess("x")
        expect($guess_word).to eq(" _ _ _ _ _ _ _ _ _ _")
      end

      it "then it should not increase the correct guesses" do
        check_the_guess("x")
        expect($correct_guesses).to eq(0)
      end

      it "then it should reduce the maximum chances" do
        check_the_guess("x")
        expect($max_chances).to eq(5)
      end
    end
  end

  describe "Testing of game_is_over_or_not? => " do
    
    context "when the game is not over yet" do
      it "then it should return false" do
        expect(game_is_over_or_not?).to be false
      end
    end

    context "when the game is over because the player has won" do
      it "then it should return true" do
        SECRET_WORD.chars.each {|letter| check_the_guess(letter)}
        expect(game_is_over_or_not?).to be true
      end
    end

    context "when the game is over because the player has lost" do
      it "then it should return true" do
        $max_chances.times {check_the_guess("x")}
        expect(game_is_over_or_not?).to be true
      end
    end
  end

  describe "Testing win? => " do
    context "when the player has won" do
      it "then it should print the winning message" do
        SECRET_WORD.chars.each {|letter| check_the_guess(letter)}
        expect{ win? }.to output("\nCongratulations! You guessed the correct word '#{SECRET_WORD}'!\n").to_stdout
      end
    end

    context "when the player has lost" do
      it "then it should print the losing message" do
        $max_chances.times {check_the_guess("x")}
        expect{ win? }.to output("\nSorry, you ran out of guesses. The word was '#{SECRET_WORD}'.\n").to_stdout
      end
    end
  end
end
