require 'rspec'
require 'guard/rspec'

require_relative '../lib/puzzle'

describe Puzzle do
  before(:each) do
    @puzzle = Puzzle.new
  end
  it "loads a word" do
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

  it "displays the current state of the puzzle" do
    expect(@puzzle.stringify).to include("_")
  end

end
