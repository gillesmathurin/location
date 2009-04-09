require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locations/new.html.erb" do
  include LocationsHelper
  
  before(:each) do
    assigns[:location] = stub_model(Location,
      :new_record? => true,
      :house_id => 1,
      :customer_id => 1
    )
  end

  it "renders new location form" do
    render
    
    response.should have_tag("form[action=?][method=post]", locations_path) do
      with_tag("input#location_house_id[name=?]", "location[house_id]")
      with_tag("input#location_customer_id[name=?]", "location[customer_id]")
    end
  end
end


