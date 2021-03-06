require 'spec_helper'

describe "trips/new" do
  before(:each) do
    assign(:trip, stub_model(Trip,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new trip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trips_path, "post" do
      assert_select "input#trip_name[name=?]", "trip[name]"
      assert_select "textarea#trip_description[name=?]", "trip[description]"
    end
  end
end
