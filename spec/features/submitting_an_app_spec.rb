require 'spec_helper'
include Warden::Test::Helpers

Warden.test_mode!

feature "Submitting an app", %Q{As a user
        I want to submit my app
        So that I can showcase it} do

  given(:user) { FactoryGirl.create(:user) }
  background { login_as(user, scope: :user) }

    scenario "with all fields filled in" do
      initial_app_count = App.count
      visit new_app_path
      fill_in "Application Name", with: "this is an app name"
      fill_in "URL", with: "http://appname.com"
      fill_in "Codebase URL", with: "http://github.com/appname"
      fill_in "Description", with: "This app is the awesomest"
      check "Display my email on the app page"
      click_button "Submit"
      expect(App.count).to eql(initial_app_count + 1)
      expect(page).to have_content("App successfully submitted")
    end

end

# feature "Submitting an app" do

#   scenario "while not signed in" do
#     visit new_app_path
#     expect(page).to have_content("You need to sign in or sign up before continuing")
#   end

# end
