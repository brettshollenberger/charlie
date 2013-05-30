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
      expect(page).to have_content("My house")
    end

    it "deletes a record" do
      visit "/events/new"
      fill_in "event[location]", :with => "Wherever"
      click_button "Create Event"
      visit "/events"
      expect(page).to have_content("Wherever")
      click_link("Destroy")
      expect(page).to_not have_content("Wherever")
      save_and_open_page
    end

    it "throws an error if an event is invalid" do
      visit "/events/new"
      click_button "Create Event"
      expect(page).to have_content("Location can't be blank")
    end
  end
end
