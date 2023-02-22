require '/home/dell/Documents/ruby/hangman/hangman_class'

describe Hangman do
    let(:hangman) { Hangman.new("aaabbbcccc") }

    describe "Testing of check_the_guess(letter) => " do
        context "when user guessed the correct letter" do
          it "then it should return the updated state of guess word" do
            expect{hangman.check_the_guess("a")}.to output("\nGood guess! You have guessed the correct letter 'a'.\n").to_stdout
            expect(hangman.guess_word).to eq(" a _ _ _ _ _ _ _ _ _")
          end
    
          it "then it should increase the correct guesses" do
            expect{hangman.check_the_guess("a")}.to output("\nGood guess! You have guessed the correct letter 'a'.\n").to_stdout
            expect(hangman.correct_guesses).to eq(1)
          end
    
          it "then it should not reduce the maximum chances" do
            expect{hangman.check_the_guess("a")}.to output("\nGood guess! You have guessed the correct letter 'a'.\n").to_stdout
            expect(hangman.max_chances).to eq(6)
          end
        end
    
        context "when user guessed the wrong letter" do
          it "then it should not change the state of guess word" do
            expect{hangman.check_the_guess("o")}.to output("\nSorry, You have guessed the wrong letter 'o'.\n").to_stdout
            expect(hangman.guess_word).to eq(" _ _ _ _ _ _ _ _ _ _")
          end
    
          it "then it should not increase the correct guesses" do
            expect{hangman.check_the_guess("o")}.to output("\nSorry, You have guessed the wrong letter 'o'.\n").to_stdout
            expect(hangman.correct_guesses).to eq(0)
          end
    
          it "then it should reduce the maximum chances" do
            expect{hangman.check_the_guess("o")}.to output("\nSorry, You have guessed the wrong letter 'o'.\n").to_stdout
            expect(hangman.max_chances).to eq(5)
          end
        end
      end
    
      describe "Testing of game_is_over_or_not? and win? => " do
        
        context "when the game is not over yet" do
          it "then game_is_over_or_not? should return false" do
            expect(hangman.game_is_over_or_not?).to be false
          end
        end
    
        context "when the game is over and has won by player" do
          it "then game_is_over_or_not? should return true and win? should print the winning message" do

            hangman.secret_word.chars.each {|letter| expect{hangman.check_the_guess(letter)}.to output("\nGood guess! You have guessed the correct letter '#{letter}'.\n").to_stdout} 
    
            expect(hangman.game_is_over_or_not?).to be true
            expect{ hangman.win? }.to output("\nCongratulations! You guessed the correct word '#{hangman.secret_word}'!\n").to_stdout
          end
        end
    
        context "when the game is over and has lost by player" do
          it "then game_is_over_or_not? should return true and win? should print the losing message" do

            hangman.max_chances.times {expect{hangman.check_the_guess("x")}.to output("\nSorry, You have guessed the wrong letter 'x'.\n").to_stdout}

            expect(hangman.game_is_over_or_not?).to be true
            expect{ hangman.win? }.to output("\nSorry, you ran out of guesses. The word was '#{hangman.secret_word}'.\n").to_stdout
          end
        end
      end
end
