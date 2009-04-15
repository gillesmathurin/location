require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/promo_generales/edit.html.erb" do
  include PromoGeneralesHelper
  
  before(:each) do
    assigns[:promo_generale] = @promo_generale = stub_model(PromoGenerale,
      :new_record? => false,
      :titre => "value for titre",
      :description => "value for description"
    )
  end

  it "renders the edit promo_generale form" do
    render
    
    response.should have_tag("form[action=#{promo_generale_path(@promo_generale)}][method=post]") do
      with_tag('input#promo_generale_titre[name=?]', "promo_generale[titre]")
      with_tag('textarea#promo_generale_description[name=?]', "promo_generale[description]")
    end
  end
end


