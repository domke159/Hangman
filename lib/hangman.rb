require_relative '../lib/dictionary.rb'
require_relative '../lib/game.rb'

puts "\nWelcome to the Hangman Game \n\n"

 loop do
    game = Game.new
    game.play
  
    puts "\nPlay again (Y/N)?"
    exit unless gets.chomp.capitalize == 'Y'
  end