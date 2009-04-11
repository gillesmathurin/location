require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/houses/show.html.erb" do
  include HousesHelper
  before(:each) do
    assigns[:house] = @house = stub_model(House,
      :nom => "value for nom",
      :adresse => "value for adresse",
      :zip => "value for zip",
      :ville => "value for ville",
      :category_id => 1,
      :user_id => 1
    )
    @mock_category = mock('category')
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ nom/)
    response.should have_text(/value\ for\ adresse/)
    response.should have_text(/value\ for\ zip/)
    response.should have_text(/value\ for\ ville/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

