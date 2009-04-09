require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/customers/show.html.erb" do
  include CustomersHelper
  before(:each) do
    assigns[:customer] = @customer = stub_model(Customer,
      :nom => "value for nom",
      :prenom => "value for prenom",
      :adresse => "value for adresse",
      :zip => "value for zip",
      :ville => "value for ville",
      :telephone => "value for telephone",
      :email => "value for email",
      :fax => "value for fax"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ nom/)
    response.should have_text(/value\ for\ prenom/)
    response.should have_text(/value\ for\ adresse/)
    response.should have_text(/value\ for\ zip/)
    response.should have_text(/value\ for\ ville/)
    response.should have_text(/value\ for\ telephone/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ fax/)
  end
end

