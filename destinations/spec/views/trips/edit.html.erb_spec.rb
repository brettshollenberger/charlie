require 'spec_helper'

describe "trips/edit" do
  before(:each) do
    @trip = assign(:trip, stub_model(Trip,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit trip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trip_path(@trip), "post" do
      assert_select "input#trip_name[name=?]", "trip[name]"
      assert_select "textarea#trip_description[name=?]", "trip[description]"
    end
  end
end
