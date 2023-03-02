require './main.rb'

describe Hangman do
  describe '#start' do
    before(:all) do
      WORDS = %w[kylas amura selldo beyondwalls].freeze
      @chances = 6
      @target = 'kylas'
      @game = Hangman.new(WORDS, @chances)
      @game.specify_target(@target)
    end
    context 'When testing Hangman game if user guesses the word' do
      it 'should show winning text' do
        @target.chars.each do |letter|
          expect_any_instance_of(Kernel).to receive(:gets).and_return(letter)
        end
        expect(@game.start()).to eq('You won the game')
      end  
    end
    context 'When testing Hangman game if user does not guesses the word' do
      it 'should show loosing text for the loosing test case' do
        @chances.times { expect_any_instance_of(Kernel).to receive(:gets).and_return('f') }
        expect(@game.start()).to eq('You lose the game')
      end  
    end
  end
end
