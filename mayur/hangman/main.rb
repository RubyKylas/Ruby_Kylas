WORDS = %w[kylas amura selldo beyondwalls].freeze
$word = WORDS.sample
$chances = 6
def hangman(word, chances)
  chances = 6
  letters = ''
  word.length.times { print '_' }
  p
  while (letters.length < word.length) && (chances > 0)
    print "Guess it Chances:#{chances} :"
    letter = gets.strip.downcase
    chances -= 1 if word.count(letter) <= 0 || letters.count(letter) > 0
    word.count(letter).times { letters += letter }
    p word.gsub(/[^#{letters}]/, '_')  if word.count(letter) > 0
  end
  letters.length == word.length ? 'You won the game' : 'You lose the game'
end
