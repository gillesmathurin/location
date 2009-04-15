require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/promo_generales/index.html.erb" do
  include PromoGeneralesHelper
  
  before(:each) do
    assigns[:promo_generales] = [
      stub_model(PromoGenerale,
        :titre => "value for titre",
        :description => "value for description"
      ),
      stub_model(PromoGenerale,
        :titre => "value for titre",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of promo_generales" do
    render
    response.should have_tag("tr>td", "value for titre".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end

