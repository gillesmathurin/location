require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/promo_generales/show.html.erb" do
  include PromoGeneralesHelper
  before(:each) do
    assigns[:promo_generale] = @promo_generale = stub_model(PromoGenerale,
      :titre => "value for titre",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ titre/)
    response.should have_text(/value\ for\ description/)
  end
end

