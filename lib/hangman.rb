require_relative '../lib/dictionary.rb'
require_relative '../lib/game.rb'

loop do
  puts "\nWelcome to the Hangman Game \n"
  puts "\nStart new game (N) / Load previous game (L)?\n\n"
  gets.chomp.capitalize == 'N' ? Game.new : Game.load_game
  puts "\nPlay again (Y/N)?"
  exit unless gets.chomp.capitalize == 'Y'
end
