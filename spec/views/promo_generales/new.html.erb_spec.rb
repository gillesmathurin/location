require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/promo_generales/new.html.erb" do
  include PromoGeneralesHelper
  
  before(:each) do
    assigns[:promo_generale] = stub_model(PromoGenerale,
      :new_record? => true,
      :titre => "value for titre",
      :description => "value for description"
    )
  end

  it "renders new promo_generale form" do
    render
    
    response.should have_tag("form[action=?][method=post]", promo_generales_path) do
      with_tag("input#promo_generale_titre[name=?]", "promo_generale[titre]")
      with_tag("textarea#promo_generale_description[name=?]", "promo_generale[description]")
    end
  end
end


