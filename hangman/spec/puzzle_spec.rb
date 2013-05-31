require 'rspec'
require 'guard/rspec'

require_relative '../lib/puzzle'

describe Puzzle do
  before(:each) do
    @puzzle = Puzzle.new
  end

  it "loads the file path" do
    expect(@puzzle.path_to_file).to eql("/Users/brettshollenberger/la/charlie/hangman/lib/words.csv")
  end

  it "counts the lines in the file" do
    expect(@puzzle.lines_in_file).to eql(109582)
  end

  it "returns a random number between 1 and the file length" do
    expect(@puzzle.rand_num).to be_a_kind_of(Integer)
    expect(@puzzle.rand_num).to be >= 1
    expect(@puzzle.rand_num).to be <= @puzzle.lines_in_file
  end

  it "selects a random word from the file" do
    expect(@puzzle.word).to be_kind_of(String)
    binding.pry
  end
end
