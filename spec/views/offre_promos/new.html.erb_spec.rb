require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/offre_promos/new.html.erb" do
  include OffrePromosHelper
  
  before(:each) do
    assigns[:offre_promo] = stub_model(OffrePromo,
      :new_record? => true,
      :titre => "value for titre",
      :description => "value for description",
      :house_id => 1
    )
  end

  it "renders new offre_promo form" do
    render
    
    response.should have_tag("form[action=?][method=post]", offre_promos_path) do
      with_tag("input#offre_promo_titre[name=?]", "offre_promo[titre]")
      with_tag("textarea#offre_promo_description[name=?]", "offre_promo[description]")
      with_tag("input#offre_promo_house_id[name=?]", "offre_promo[house_id]")
    end
  end
end


