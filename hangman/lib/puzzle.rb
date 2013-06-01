require './wordify'
require './letter'

class Puzzle
  include Enumerable
  attr_reader :word, :puzzle, :stringify, :guessed

  def initialize
    @word = Wordify.new
    @puzzle = []
    @stringify = ""
    @guessed = []
    puzzlify
  end

  def split_word
    @word.split('')
  end

  def reset
    initialize
  end

  def puzzlify
    split_word.each { |letter| @puzzle.push(Letter.new(@word[letter])) }
  end

  def stringify
    @stringify = ""
    @puzzle.each { |letter| @stringify << letter.display }
    @stringify
  end

  def display
    puts stringify
  end

  def each(&block)
    @puzzle.each(&block)
  end

  def guess(guess)
    @puzzle.each { |letter| letter.display = guess if letter.secret == guess }
    @guessed.push(guess)
    self.display
  end

  def in_puzzle?(guess)
    @puzzle.each { |letter| return true if letter.secret == guess; next }
    return false
  end

  def solved?
    @puzzle.each { |letter| return false if letter.display == "_"; next }
    return true
  end

  def guessed?(guess)
    @guessed.each { |g| return true if g == guess }
    return false
  end

  def found?(guess)
    return true if in_puzzle?(guess) && !guessed?(guess)
    return false
  end

end


