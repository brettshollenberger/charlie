require 'csv'

class Word < String
  attr_reader :rand_num

  def initialize
    self << select_a_random_word
  end

  def lines_in_file
    File.foreach(path_to_file).inject(0) { |count, line| count += 1 }
  end

private

  def select_a_random_word
    select_random_num
    count = 0
    File.foreach(path_to_file) { |line| count += 1; return line.chomp if count == @rand_num }
  end

  def path_to_file(file='words.csv')
    File.join(File.dirname(__FILE__), file)
  end

  def select_random_num
    @rand_num = rand(1..lines_in_file)
  end

end
