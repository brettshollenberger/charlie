require 'spec_helper'

describe MenuItem do
  describe "validations" do
    let(:menu_item) { FactoryGirl.build(:menu_item) }

    it "is valid when it has all required and valid attributes" do
      expect(menu_item).to be_valid
    end

    it "requires a name" do
      menu_item.name = ""
      expect(menu_item).not_to be_valid
    end

    it "requires a description" do
      menu_item.description = ""
      expect(menu_item).not_to be_valid
    end

    it "requires a price_in_cents" do
      menu_item.price_in_cents = nil
      expect(menu_item).not_to be_valid
    end
  end

  describe "displays price in dollars" do
    let(:menu_item1) { FactoryGirl.build(:menu_item, price_in_cents: 1309)}
    let(:menu_item2) { FactoryGirl.build(:menu_item, price_in_cents: 9)}

    it "converts to dollars for big numbers" do
      expect(menu_item1.price_in_dollars).to eql(13.09)
    end

    it "converts to dollars for small cents" do
      expect(menu_item2.price_in_dollars).to eql(0.09)
    end
  end
end
