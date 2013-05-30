require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :bird => "Bird",
      :location => "Location",
      :spotter => "Spotter"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Bird/)
    rendered.should match(/Location/)
    rendered.should match(/Spotter/)
  end
end
