# Hangman Game by Hardik Jade
puts 'Welcome to the Hangman Game'
puts '-----------------------------------------------------------------'

# Constants
# --------------------------------------------
WORDS = %w[elephant computer switch kylas ball flower okay prodigy enigma bottle].freeze
TARGET = WORDS.sample.upcase
LENGTH = TARGET.length
# --------------------------------------------

# puts TARGET

# Variables
# --------------------------------------------
lives = 5
user_guess = ['-'] * LENGTH
# --------------------------------------------

# SHOW USER THE RESPONSE
# --------------------------------------------
def show(user_guess, lives)
  user_guess.each{ |c| print(" #{c} ") }
  puts "\t\tLives #{lives}"
end
# --------------------------------------------

while lives >= 0
  show(user_guess, lives)
  unless user_guess.include?('-')
    puts "\nCongratulations you won"
    break
  end
  print("\nEnter Your Choice\t")
  input_char = gets.chomp[0].upcase
  reduce_live = true
  TARGET.each_char.with_index do |letter, index|
    if letter == input_char
      reduce_live = false
      user_guess[index] = letter
    end
  end
  lives = reduce_live ? lives - 1 : lives
end
