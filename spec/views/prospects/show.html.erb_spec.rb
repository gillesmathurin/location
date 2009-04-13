require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/prospects/show.html.erb" do
  include ProspectsHelper
  before(:each) do
    assigns[:prospect] = @prospect = stub_model(Prospect,
      :nom => "value for nom",
      :prenom => "value for prenom",
      :email => "value for email",
      :telephone => "value for telephone",
      :fax => "value for fax"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ nom/)
    response.should have_text(/value\ for\ prenom/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ telephone/)
    response.should have_text(/value\ for\ fax/)
  end
end

