WORDS = ['krishnankit', 'mayur', 'vaibhav', 'hardik'].freeze
word = WORDS.sample.split("")

def hangman(word)   
  len = word.length
  dashes = "-" * len
  chances = 6
  right = 0
  while right < len
    if chances == 0
      puts "Game over!"
      puts  "The word was #{word.join("")}"
      return "You Lost!"
    end
    puts dashes
    print "Enter the character: "
    char = gets.chomp.downcase
    if !char.match?(/[[:alpha:]]/)
      puts "Please Enter letter only."
    elsif word.include? char
      puts "Right."
      word.each_with_index{
        |x, i| # i is index and x is value at i in word
        if x == char
          dashes[i] = char
          right += 1
          word[i] = '_'
        end
      }
      len = word.length
    else
      puts "Wrong."
      chances -= 1
    end
    if len == right
      puts dashes
      puts "You Won!"
      return "You Won!"
    end
  end
end

hangman(word)