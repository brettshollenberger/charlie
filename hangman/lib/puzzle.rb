require 'csv'
require 'pry'
require 'letter'

class Puzzle
  include Enumerable
  attr_reader :randify, :word, :puzzle

  def initialize
    @randify = rand_num
    @word = wordify
    @puzzle = []
    puzzlify
  end

  def path_to_file(file='words.csv')
    File.join(File.dirname(__FILE__), file)
  end

  def lines_in_file
    File.foreach(path_to_file).inject(0) { |count, line| count += 1 }
  end

  def rand_num
    rand(1..lines_in_file)
  end

  def wordify
    count = 0
    File.foreach(path_to_file) { |line| count += 1; return line.chomp if count == @randify }
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

  def each(&block)
    @puzzle.each(&block)
  end

end


