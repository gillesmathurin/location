require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/offre_promos/show.html.erb" do
  include OffrePromosHelper
  before(:each) do
    assigns[:offre_promo] = @offre_promo = stub_model(OffrePromo,
      :titre => "value for titre",
      :description => "value for description",
      :house_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ titre/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/1/)
  end
end

