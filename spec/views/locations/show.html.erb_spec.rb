require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locations/show.html.erb" do
  include LocationsHelper
  before(:each) do
    assigns[:location] = @location = stub_model(Location,
      :house_id => 1,
      :customer_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

