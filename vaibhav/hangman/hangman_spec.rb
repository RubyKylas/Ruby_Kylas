#hangman test cases

load 'hangman.rb'

describe 'hangman game' do
  context "when user put correct answers" do
    it "user won the game" do

      expect_any_instance_of(Kernel).to receive(:gets).and_return("v")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("a")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("i")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("b")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("h")
      
      result = hangman()
      expect(result).to eq("you won the game")
      
    end
  end
  
  context "when user put all wrong answer" do
    it "user loses the game" do

      expect_any_instance_of(Kernel).to receive(:gets).and_return("y")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("r")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("k")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("g")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("l")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("g")
      
      result = hangman()
      expect(result).to eq("you lost the game")
    end
  end
end
 
#hangman test cases