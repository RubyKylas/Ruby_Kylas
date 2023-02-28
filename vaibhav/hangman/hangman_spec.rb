#hangman test cases

load 'hangman.rb'

describe 'hangman game' do
  context "when user put correct answers" do
    it "user won the game" do

      expect_any_instance_of(Kernel).to receive(:gets).and_return("v","a","i","b","h")
      result = hangman()
      expect(result).to eq("you won the game")
      
    end
  end
  
  context "when user put all wrong answer" do
    it "user loses the game" do

      expect_any_instance_of(Kernel).to receive(:gets).and_return("y","r","k","g","l","g")
      result = hangman()
      expect(result).to eq("you lost the game")
      
    end
  end
end
 
#hangman test cases