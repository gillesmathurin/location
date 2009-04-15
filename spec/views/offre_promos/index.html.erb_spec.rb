require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/offre_promos/index.html.erb" do
  include OffrePromosHelper
  
  before(:each) do
    assigns[:offre_promos] = [
      stub_model(OffrePromo,
        :titre => "value for titre",
        :description => "value for description",
        :house_id => 1
      ),
      stub_model(OffrePromo,
        :titre => "value for titre",
        :description => "value for description",
        :house_id => 1
      )
    ]
  end

  it "renders a list of offre_promos" do
    render
    response.should have_tag("tr>td", "value for titre".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

