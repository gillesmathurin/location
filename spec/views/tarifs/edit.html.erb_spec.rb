require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tarifs/edit.html.erb" do
  include TarifsHelper
  
  before(:each) do
    assigns[:tarif] = @tarif = stub_model(Tarif,
      :new_record? => false,
      :days_nb => 1,
      :price => 9.99,
      :nom => "value for nom"
    )
  end

  it "renders the edit tarif form" do
    render
    
    response.should have_tag("form[action=#{tarif_path(@tarif)}][method=post]") do
      with_tag('input#tarif_days_nb[name=?]', "tarif[days_nb]")
      with_tag('input#tarif_price[name=?]', "tarif[price]")
      with_tag('input#tarif_nom[name=?]', "tarif[nom]")
    end
  end
end


