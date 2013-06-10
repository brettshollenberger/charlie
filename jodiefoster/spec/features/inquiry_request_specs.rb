require 'spec_helper'
include Warden::Test::Helpers

Warden.test_mode!

feature %Q{As a site visitor
I want to contact DogHub staff
So that I can tell them how awesome they are}, "Creating contact inquiries" do

  # "I must specify a valid email address"
  given(:user) { FactoryGirl.create(:user) }
  background do
    login_as(user, scope: :user)
    visit new_inquiry_path
  end

  scenario "I want to create a new inquiry" do
    fill_in "inquiry[subject]", with: "Great dergs"
    fill_in "inquiry[description]", with: "I'm so improrsed"
    click_button "Create Inquiry"
    expect(page).to have_content("Great jorb")
    expect(page).to have_content("Great dergs")
  end

  scenario "I must specify a subject" do
    fill_in "inquiry[description]", with: "I'm so improrsed"
    click_button "Create Inquiry"
    expect(page).to have_content("Looks like ya done fucked up.")
  end

  scenario "I must specify a description" do
    fill_in "inquiry[subject]", with: "Great dergs"
    click_button "Create Inquiry"
    expect(page).to have_content("Looks like ya done fucked up.")
  end
end

feature %Q{As an admin
I want to review contact inquiries
So that I can respond or take action}, "Viewing contact inquiries" do

  given(:user) { FactoryGirl.create(:user) }
  given(:user2) { user.dup }
  background do
    user2.email = "anyone@gmail.com"
    user2.admin = false
    user2.save
  end

  scenario "I can see a list of all contact inquiries as an admin" do
    login_as(user, scope: :user)
    visit new_inquiry_path
    fill_in "inquiry[subject]", with: "Great dergs"
    fill_in "inquiry[description]", with: "I'm so improrsed"
    click_button "Create Inquiry"
    expect(page).to have_content("Great jorb")
    expect(page).to have_content("Great dergs")
    click_link "All Inquiries"
    expect(page).to have_content("Great dergs")
  end

  scenario "I cannot see a list of all contact inquiries as a non-admin" do
    login_as(user2, scope: :user2)
    visit new_inquiry_path
    expect(page).to have_content("Sign in")
  end
end

feature %Q{As an admin
I want to delete an inquiry
So that I can remove spam or other undesirable inquiries}, "Deleting contact inquiries" do

  given(:user) { FactoryGirl.create(:user) }
  background do
    login_as(user, scope: :user)
    visit new_inquiry_path
    fill_in "inquiry[subject]", with: "Great dergs"
    fill_in "inquiry[description]", with: "I'm so improrsed"
    click_button "Create Inquiry"
    expect(page).to have_content("Great jorb")
    expect(page).to have_content("Great dergs")
    visit inquiries_path
  end

  scenario "I delete a contact inquiry" do
    click_link "Destroy"
    expect(page).to have_content("Inquiry deleted.")
    expect(page).to_not have_content("Great dergs")
  end
end


