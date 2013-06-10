require 'spec_helper'

describe "Inquiry" do
  let(:user) { FactoryGirl.build(:user) }
  let(:inquiry) { FactoryGirl.build(:inquiry) }

  it "is valid" do
    expect(inquiry).to be_valid
  end

  it "is invalid without a user" do
    inquiry.user = nil
    expect(inquiry).to_not be_valid
  end

  it "is invalid without a subject" do
    inquiry.subject = nil
    expect(inquiry).to_not be_valid
  end

  it "is invalid without a description" do
    inquiry.description = nil
    expect(inquiry).to_not be_valid
  end
end
