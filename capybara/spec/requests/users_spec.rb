require 'spec_helper'

describe "Users" do
  describe "GET /users", :type => :feature do
    it "visits a page a-okay" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get "/users"
      response.status.should be(200)
    end

    it "submits a user" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit "/users/new"
      fill_in "user[username]", :with => "byort"
      click_button "Create User"
      expect(page).to have_content("success")
      expect(page).to have_content("byort")
    end

    it "destroys a user" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit "/users/new"
      fill_in "user[username]", :with => "byort"
      click_button "Create User"
      expect(page).to have_content("success")
      click_link "Back"
      expect(page).to have_content("byort")
      click_link "Destroy"
      visit "/users"
      expect(page).to_not have_content("byort")
    end

    it "adds to the database" do
      visit "/users/new"
      fill_in "user[username]", :with => "Whatever"
      click_button "Create User"
      expect(User.last.username).to eql("Whatever")
    end

    it "requires validation" do
      visit "/users/new"
      click_button "Create User"
      expect(page).to have_content("Username can't be blank")
    end
  end
end
