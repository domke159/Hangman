class Dictionary
  attr_accessor :valid_dictionary

  def initialize
    dictionary = File.open('5desk.txt', 'r')
    @valid_dictionary = []
    dictionary.each_line do |line|
      @valid_dictionary << line if line.length >= 5 && line.length <= 12
    end
  end

  def select_word
    @valid_dictionary.sample.upcase
  end
end
