require 'rspec'
require 'guard/rspec'

require_relative '../lib/wordify'

describe Wordify do
  before(:each) do
    @wordify = Wordify.new
  end

  it "counts the lines in the file" do
    expect(@wordify.lines_in_file).to eql(109582)
  end

  it "returns a random number between 1 and the file length" do
    expect(@wordify.rand_num).to be_a_kind_of(Integer)
    expect(@wordify.rand_num).to be >= 1
    expect(@wordify.rand_num).to be <= @wordify.lines_in_file
  end

  it "selects a random word from the file" do
    expect(@wordify).to be_kind_of(String)
  end
end
