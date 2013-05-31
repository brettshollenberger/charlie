require 'wordify'
require 'letter'

class Puzzle
  include Enumerable
  attr_reader :word, :puzzle, :stringify

  def initialize
    @word = Wordify.new
    @puzzle = []
    @stringify = ""
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
    puts @stringify
  end

  def each(&block)
    @puzzle.each(&block)
  end

end


