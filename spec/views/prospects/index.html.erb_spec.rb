require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/prospects/index.html.erb" do
  include ProspectsHelper
  
  before(:each) do
    assigns[:prospects] = [
      stub_model(Prospect,
        :nom => "value for nom",
        :prenom => "value for prenom",
        :email => "value for email",
        :telephone => "value for telephone",
        :fax => "value for fax"
      ),
      stub_model(Prospect,
        :nom => "value for nom",
        :prenom => "value for prenom",
        :email => "value for email",
        :telephone => "value for telephone",
        :fax => "value for fax"
      )
    ]
  end

  it "renders a list of prospects" do
    render
    response.should have_tag("tr>td", "value for nom".to_s, 2)
    response.should have_tag("tr>td", "value for prenom".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for telephone".to_s, 2)
    response.should have_tag("tr>td", "value for fax".to_s, 2)
  end
end

