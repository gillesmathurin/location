require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locations/index.html.erb" do
  include LocationsHelper
  
  before(:each) do
    assigns[:locations] = [
      stub_model(Location,
        :house_id => 1,
        :customer_id => 1,
        :date_debut => "2009-09-09"
      ),
      stub_model(Location,
        :house_id => 1,
        :customer_id => 1,
        :date_debut => "2009-09-09"
      )
    ]
  end

  # it "renders a list of locations" do
  #   render
  #   response.should have_tag("tr>td", 1.to_s, 2)
  #   response.should have_tag("tr>td", 1.to_s, 2)
  # end
end

