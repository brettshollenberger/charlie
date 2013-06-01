require 'rspec'
require 'guard/rspec'

require_relative '../lib/game'

describe Game do
  before(:each) do
    @game = Game.new
    @game.stub(:gets).and_return("5", "brett", "kyrie", "don", "stephan", "drake", "a",
      "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
      "s", "t", "u", "v", "w", "x", "y", "z")
    @game.start
  end

  context "it sets up the game" do
    it "gets the number of players in a game" do
      expect(@game.player_count).to eql(5)
    end

    it "gets Player 1's name" do
      expect(@game.players[0]).to eql("Brett")
    end

    it "gets Player 2's name" do
      expect(@game.players[1]).to eql("Kyrie")
    end

    it "gets Player 3's name" do
      expect(@game.players[2]).to eql("Don")
    end

    it "gets Player 4's name" do
      expect(@game.players[3]).to eql("Stephan")
    end

    it "gets Player 5's name" do
      expect(@game.players[4]).to eql("Drake")
    end

  end

  context "gameplay" do

    it "randomizes turn order" do
      expect(@game.player_order).to_not eql(@game.players)
    end

    it "plays the game" do
      expect(@game.puzzle.solved?).to eql(true)
    end

  end


end


