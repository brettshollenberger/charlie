require 'spec_helper'

describe Event do
  describe "Page visits", :type => :feature do
    it "visits the page" do
      visit "/events"
      expect(page.status_code).to eql(200)
    end

    it "displays an individual event" do
      event = Event.create(location: "Wherever")
      visit event_path(event.id)
      expect(page.status_code).to eql(200)
    end

    it "adds an event with location" do
      previous_count = Event.count
      visit "/events/new"
      fill_in 'event[location]', :with => "My house"
      click_button 'Create Event'
      new_count = Event.count
      expect(new_count - previous_count).to eql(1)
      expect(Event.last.location).to eql("My house")
      visit "/events"
      expect(page).to have_content("My house")
    end
  end
end
