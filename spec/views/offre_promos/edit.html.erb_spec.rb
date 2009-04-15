require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/offre_promos/edit.html.erb" do
  include OffrePromosHelper
  
  before(:each) do
    assigns[:offre_promo] = @offre_promo = stub_model(OffrePromo,
      :new_record? => false,
      :titre => "value for titre",
      :description => "value for description",
      :house_id => 1
    )
  end

  it "renders the edit offre_promo form" do
    render
    
    response.should have_tag("form[action=#{offre_promo_path(@offre_promo)}][method=post]") do
      with_tag('input#offre_promo_titre[name=?]', "offre_promo[titre]")
      with_tag('textarea#offre_promo_description[name=?]', "offre_promo[description]")
      with_tag('input#offre_promo_house_id[name=?]', "offre_promo[house_id]")
    end
  end
end


