require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tarifs/index.html.erb" do
  include TarifsHelper
  
  before(:each) do
    assigns[:tarifs] = [
      stub_model(Tarif,
        :days_nb => 1,
        :price => 9.99,
        :nom => "value for nom"
      ),
      stub_model(Tarif,
        :days_nb => 1,
        :price => 9.99,
        :nom => "value for nom"
      )
    ]
  end

  it "renders a list of tarifs" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", "value for nom".to_s, 2)
  end
end

