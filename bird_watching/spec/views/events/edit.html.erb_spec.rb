require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :bird => "MyString",
      :location => "MyString",
      :spotter => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_path(@event), "post" do
      assert_select "input#event_bird[name=?]", "event[bird]"
      assert_select "input#event_location[name=?]", "event[location]"
      assert_select "input#event_spotter[name=?]", "event[spotter]"
    end
  end
end
