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
  end

  it "resets the puzzle" do
    word1 = @puzzle.word
    word2 = @puzzle.reset
    expect(word1).to_not eql(word2)
  end

  it "splits the word" do
    expect(@puzzle.split_word).to be_kind_of(Array)
  end

  it "sets the puzzle using the word" do
    expect(@puzzle.puzzle.first.secret).to eql(@puzzle.word[0])
  end
end
