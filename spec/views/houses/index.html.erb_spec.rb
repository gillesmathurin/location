require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/houses/index.html.erb" do
  include HousesHelper
  
  before(:each) do
    assigns[:houses] = [
      stub_model(House,
        :nom => "value for nom",
        :adresse => "value for adresse",
        :zip => "value for zip",
        :ville => "value for ville",
        :category_id => 1,
        :user_id => 1
      ),
      stub_model(House,
        :nom => "value for nom",
        :adresse => "value for adresse",
        :zip => "value for zip",
        :ville => "value for ville",
        :category_id => 1,
        :user_id => 1
      )
    ]
  end

  it "renders a list of houses" do
    render
    response.should have_tag("tr>td", "value for nom".to_s, 2)
    response.should have_tag("tr>td", "value for adresse".to_s, 2)
    response.should have_tag("tr>td", "value for zip".to_s, 2)
    response.should have_tag("tr>td", "value for ville".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

