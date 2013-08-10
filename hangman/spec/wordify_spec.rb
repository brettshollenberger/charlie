require 'rspec'
require 'guard/rspec'

require_relative '../lib/hangman'

describe Word do
  before(:each) do
    @word = Word.new
  end

  it "counts the lines in the file" do
    expect(@word.lines_in_file).to eql(109583)
  end

  it "returns a random number between 1 and the file length" do
    expect(@word.rand_num).to be_a_kind_of(Integer)
    expect(@word.rand_num).to be >= 1
    expect(@word.rand_num).to be <= @word.lines_in_file
  end

  it "selects a random word from the file" do
    expect(@word).to be_kind_of(String)
  end

end
