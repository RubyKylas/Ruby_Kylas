require_relative "../hangman"

describe "hangman" do
  context "When user enters all right characters." do
    begin
      word = "mayur"
    end
    it "You Won! is returned" do
      expect_any_instance_of(Kernel).to receive(:gets).and_return("m")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("a")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("y")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("u")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("r")

      result = hangman(word.split(""))
      expect(result).to eq ("You Won!")
    end
  end

  context "When user enters wrong chars 6 times." do
    begin
      word = "mayur"
    end
    it "You Lost! is returned" do
      expect_any_instance_of(Kernel).to receive(:gets).and_return("t")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("e")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("i")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("f")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("p")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("z")

      result = hangman(word.split(""))
      expect(result).to eq ("You Lost!")
    end
  end
end