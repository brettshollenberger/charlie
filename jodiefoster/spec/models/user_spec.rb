require 'spec_helper'

describe "User" do
  let(:user) { FactoryGirl.create(:user) }
  let(:inquiry) { FactoryGirl.create(:inquiry) }

  it "is valid" do
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user.email = nil
    expect(user).to_not be_valid
  end

  it "is invalid without a password" do
    user.password = nil
    expect(user).to_not be_valid
  end

  it "is invalid if the password confirmation doesn't match" do
    user.password_confirmation = "foosball"
    expect(user).to_not be_valid
  end

  it "destroys associated inquiries if it is deleted" do
    user.destroy
    expect(Inquiry.first).to be_nil
  end

end
