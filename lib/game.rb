require 'yaml'

class Game
  MAX_GUESSES = 12
  attr_reader :word
  attr_accessor :guess
  attr_reader :guesses

  def initialize
    @guesses = 0
    @word = Dictionary.new.select_word
    puts @word.gsub(/\S/, '_')
    @guess = @word.dup.gsub!(/\S/, '_')
    play
  end

  def self.load_game
    puts "\nWelcome back!"
    save_file = File.open('saved_games/save_file.yaml')
    @game = YAML.load(save_file)
    @game.play
  end

  def save_game
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    yaml = YAML.dump(self)
    File.open('saved_games/save_file.yaml', 'w') { |x| x.write yaml }
  end

  def feedback(letter)
    @word.each_char.with_index do |char, index|
      @guess[index] = letter if char == letter
    end
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
    puts "\nDo you want to save your game? (Y/N)?"
    save_game if gets.chomp.capitalize == 'Y'
  end

  def play
    has_won = false
    until has_won || @guesses == MAX_GUESSES
      guess_letter
      has_won = @guess == @word
      @guesses += 1
    end
    has_won ?
      puts("\nThe word has been guessed!") :
      puts("\nThe word has not been guessed.")
  end
end
