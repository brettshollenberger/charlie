require 'spec_helper'

describe Spotting do
  describe "validations" do
    let(:robin) do
      {
        bird_name: "Robin",
        location: "Boston, MA",
        spotted_by: "Brett"
      }
    end

    let(:jay) do
      {
        bird_name: "Jay",
        location: "Boston, MA",
        spotted_by: "Brett"
      }
    end

    let(:spotting) { FactoryGirl.build(:spotting) }
    let(:spotting2) { Spotting.new(robin) }
    let(:spotting3) { Spotting.new(jay) }

    before(:each) do
      spotting.save
      spotting2.save
      spotting3.save
    end

    after(:each) do
      spotting.delete
      spotting2.delete
      spotting3.delete
    end

    it "is valid when it has all required and valid attributes" do
      expect(spotting).to be_valid
    end

    it "requires a bird name" do
      spotting.bird_name = ""
      expect(spotting).not_to be_valid
    end

    it "requires a location" do
      spotting.location = ""
      expect(spotting).not_to be_valid
    end

    it "provides the number of spottings for a particular bird" do
      expect(Spotting.spottings(bird_name: "Jay")).to eql(1)
    end

    it "provides the number of spottings for a particular location" do
      expect(Spotting.spottings(location: "Boston, MA")).to eql(2)
    end

    it "provides the number of spottings for a particular spotter" do
      expect(Spotting.spottings(spotted_by: "Brett")).to eql(2)
    end

    it "can search with multiple inputs" do
      expect(Spotting.spottings(spotted_by: "Brett", bird_name: "Jay")).to eql(1)
    end

    it "does not return anything if it can't find a match" do
      expect(Spotting.spottings(spotted_by: "Brett", bird_name: "Jay", location: "Revere, MA")).to eql(0)
    end

    it "provides the total number of byords if no argument is supplied to spottings" do
      expect(Spotting.spottings).to eql(3)
    end

    it "provides the commonality of a byord" do
      expect(Spotting.commonality("Jay")).to eql(0.3333333333333333)
    end

    it "creates a Spotting instance via FactoryGirl" do
      spottings = []
      ["robin", "robin", "eagle"].each do |bird_name|
        spottings << FactoryGirl.create(:spotting, bird_name: bird_name)
      end
      puts spottings.inspect
    end
  end
end
