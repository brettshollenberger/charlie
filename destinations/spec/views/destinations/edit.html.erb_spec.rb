require 'spec_helper'

describe "destinations/edit" do
  before(:each) do
    @destination = assign(:destination, stub_model(Destination,
      :trip_id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit destination form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", destination_path(@destination), "post" do
      assert_select "input#destination_trip_id[name=?]", "destination[trip_id]"
      assert_select "input#destination_name[name=?]", "destination[name]"
    end
  end
end
