require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/customers/index.html.erb" do
  include CustomersHelper
  
  before(:each) do
    assigns[:customers] = [
      stub_model(Customer,
        :nom => "value for nom",
        :prenom => "value for prenom",
        :adresse => "value for adresse",
        :zip => "value for zip",
        :ville => "value for ville",
        :telephone => "value for telephone",
        :email => "value for email",
        :fax => "value for fax"
      ),
      stub_model(Customer,
        :nom => "value for nom",
        :prenom => "value for prenom",
        :adresse => "value for adresse",
        :zip => "value for zip",
        :ville => "value for ville",
        :telephone => "value for telephone",
        :email => "value for email",
        :fax => "value for fax"
      )
    ]
  end

  it "renders a list of customers" do
    render
    response.should have_tag("tr>td", "value for nom".to_s, 2)
    response.should have_tag("tr>td", "value for prenom".to_s, 2)
    response.should have_tag("tr>td", "value for adresse".to_s, 2)
    response.should have_tag("tr>td", "value for zip".to_s, 2)
    response.should have_tag("tr>td", "value for ville".to_s, 2)
    response.should have_tag("tr>td", "value for telephone".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for fax".to_s, 2)
  end
end

