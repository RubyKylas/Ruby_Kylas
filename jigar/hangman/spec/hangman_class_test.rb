require '/home/dell/ruby_Kylas/jigar/hangman/hangman_class'

describe Hangman do
  let(:hangman) { Hangman.new("abbbccabxc") }

  describe "#check_the_guess(letter):" do
    context "when user guessed the correct letter" do
      it "then it should return the updated state of guess word" do
        hangman.check_the_guess("a")
        expect(hangman.guess_word).to eq(" a _ _ _ _ _ a _ _ _")
      end

      it "then it should not reduce the maximum chances" do
        hangman.check_the_guess("a")
        expect(hangman.max_chances).to eq(6)
      end
    end

    context "when user guessed the wrong letter" do
      it "then it should not change the state of guess word" do
        hangman.check_the_guess("g")
        expect(hangman.guess_word).to eq(" _ _ _ _ _ _ _ _ _ _")
      end

      it "then it should reduce the maximum chances" do
        hangman.check_the_guess("g")
        expect(hangman.max_chances).to eq(5)
      end
    end
  end

  describe "#game_is_over_or_not?:" do
    
    context "when the game is not over yet" do
      it "then it should return false" do
        expect(hangman.game_is_over_or_not?).to be false
      end
    end

    context "when the game is over because the player has won" do
      it "then it should return true" do
        hangman.secret_word.chars.uniq.each {|letter| hangman.check_the_guess(letter)}
        expect(hangman.game_is_over_or_not?).to be true
      end
    end

    context "when the game is over because the player has lost" do
      it "then it should return true" do
        hangman.max_chances.times {hangman.check_the_guess("g")}
        expect(hangman.game_is_over_or_not?).to be true
      end
    end
  end

  describe "#win?:" do
    context "when the player has won" do
      it "then it should print the winning message" do
        hangman.secret_word.chars.uniq.each {|letter| hangman.check_the_guess(letter)}
        expect{ hangman.win? }.to output("\nCongratulations! You guessed the correct word '#{hangman.secret_word}'!\n").to_stdout
      end
    end

    context "when the player has lost" do
      it "then it should print the losing message" do
        hangman.max_chances.times {hangman.check_the_guess("g")}
        expect{ hangman.win? }.to output("\nSorry, you ran out of guesses. The word was '#{hangman.secret_word}'.\n").to_stdout
      end
    end
  end
end

