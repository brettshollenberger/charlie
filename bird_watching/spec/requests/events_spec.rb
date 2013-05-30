require 'spec_helper'

describe "Events" do
  describe "GET /events", :type => :feature do
    before(:each) do
      bird = FactoryGirl.build(:event)
    end

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get events_path
      response.status.should be(200)
    end

    it "gives an error if there aren't any events" do
      visit '/events'
      expect(page).to have_content("It's a hard knock life.")
    end

    it "enters an event" do
      visit '/events/new'
      fill_in "event[bird]", :with => "Jay"
      fill_in "event[location]", :with => "Wherever"
      fill_in "event[spotter]", :with => "Brett"
      click_button "Create Event"
      click_link "Back"
      expect(page).to have_content("Jay")
    end
  end
end
