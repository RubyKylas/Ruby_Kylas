require_relative "../hangman"

describe "hangman" do
  context "When user enters all right characters." do
    begin
      word = "mayur"
    end
    it "You Won." do
      expect_any_instance_of(Kernel).to receive(:gets).and_return("m")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("a")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("y")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("u")
      expect_any_instance_of(Kernel).to receive(:gets).and_return("r")

      expect do
        hangman(word.split(""))
      end.to output(%{Right.
Right.
Right.
Right.
Right.
You Won!}).to_stdout
    end
  end
end