require 'rspec'
require 'guard/rspec'

require_relative "../lib/hangman"

describe Letter do
  before(:each) do
    @letter = Letter.new('a')
  end
  it "is unknown to start" do
    expect(@letter.display).to eql('_')
  end

  it "has a secret value" do
    expect(@letter.secret).to eql('a')
  end
end
