class Game
  MAX_GUESSES = 12
  attr_reader :word
  attr_accessor :guess

  def initialize
    @word = Dictionary.new.select_word
    puts @word.gsub(/\S/, '_')
    puts @word
    @guess = @word.dup.gsub!(/\S/, '_')
    puts @guess
  end

  def feedback(letter)
    @word.each_char.with_index { |char, index|
      @guess[index] = letter if char == letter 
    }
    puts @guess
  end

  def guess_letter
    letter = ''
    loop do
      puts "\nPlease make your guess\n"
      letter = gets.chomp.upcase
      if letter =~ /[[:alpha:]]/
        feedback(letter)
        break
      else
        puts("\nWrong selection. Try again. \n")
      end
    end
  end

  def play
    guesses = 0
    has_won = false
    until has_won || guesses == MAX_GUESSES 
      guess_letter()
      has_won = @guess == @word
      guesses += 1
    end
    has_won ?
      puts("\nThe word has been guessed!") :
      puts("\nThe word has not been guessed.")
  end
end