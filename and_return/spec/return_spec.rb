require 'rspec'
require 'guard/rspec'

require_relative "../lib/return"

describe Returns do
  before(:each) do
    @returns = Returns.new
    @returns.stub(:gets).and_return("1", "2", "3")
  end

  it "returns each number" do
    expect(@returns.ask).to eql(1)
    expect(@returns.ask).to eql(2)
    expect(@returns.ask).to eql(3)
    expect(@returns.ask).to_not eql(4)
  end
end

