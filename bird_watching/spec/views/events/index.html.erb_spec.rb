require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :bird => "Bird",
        :location => "Location",
        :spotter => "Spotter"
      ),
      stub_model(Event,
        :bird => "Bird",
        :location => "Location",
        :spotter => "Spotter"
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bird".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Spotter".to_s, :count => 2
  end
end
