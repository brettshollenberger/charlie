require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :bird => "MyString",
      :location => "MyString",
      :spotter => "MyString"
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", events_path, "post" do
      assert_select "input#event_bird[name=?]", "event[bird]"
      assert_select "input#event_location[name=?]", "event[location]"
      assert_select "input#event_spotter[name=?]", "event[spotter]"
    end
  end
end
