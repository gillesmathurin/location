require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tarifs/show.html.erb" do
  include TarifsHelper
  before(:each) do
    assigns[:tarif] = @tarif = stub_model(Tarif,
      :days_nb => 1,
      :price => 9.99,
      :nom => "value for nom"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/9\.99/)
    response.should have_text(/value\ for\ nom/)
  end
end

