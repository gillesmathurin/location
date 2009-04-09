require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tarifs/new.html.erb" do
  include TarifsHelper
  
  before(:each) do
    assigns[:tarif] = stub_model(Tarif,
      :new_record? => true,
      :days_nb => 1,
      :price => 9.99,
      :nom => "value for nom"
    )
  end

  it "renders new tarif form" do
    render
    
    response.should have_tag("form[action=?][method=post]", tarifs_path) do
      with_tag("input#tarif_days_nb[name=?]", "tarif[days_nb]")
      with_tag("input#tarif_price[name=?]", "tarif[price]")
      with_tag("input#tarif_nom[name=?]", "tarif[nom]")
    end
  end
end


