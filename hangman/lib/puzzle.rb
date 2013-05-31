require 'csv'
require 'pry'

class Puzzle
  attr_reader :randify, :word

  def initialize
    @randify = rand_num
    @count = 0
    @word = wordify
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
    File.foreach(path_to_file) { |line| @count += 1; return line.chomp if @count == @randify }
  end

  def reset
    initialize
  end

end


