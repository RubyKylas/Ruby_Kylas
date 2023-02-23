class Hangman
  def initialize(words,chances)
    @word = words.sample
    @chances = chances
  end

  def specify_target(target)
    @word = target
  end
  
  def start()
    letters = ''
    @word.length.times { print '_' }
    while (letters.length < @word.length) && (@chances > 0)
      print "Guess it Chances:#{@chances} :"
      letter = gets.strip.downcase
      @chances -= 1 if @word.count(letter) <= 0 || letters.count(letter) > 0
      @word.count(letter).times { letters += letter }
      p @word.gsub(/[^#{letters}]/, '_')  if @word.count(letter) > 0
    end
    letters.length == @word.length ? 'You won the game' : 'You lose the game'
  end
end
