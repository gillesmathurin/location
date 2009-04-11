require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/houses/edit.html.erb" do
  include HousesHelper
  
  before(:each) do
    assigns[:house] = @house = stub_model(House,
      :new_record? => false,
      :nom => "value for nom",
      :adresse => "value for adresse",
      :zip => "value for zip",
      :ville => "value for ville",
      :category_id => 1,
      :user_id => 1
    )
    assigns[:categories] = @categories = [mock_model(Category, :nom => "value for nom")]
  end

  it "renders the edit house form" do
    render
    
    response.should have_tag("form[action=#{house_path(@house)}][method=post]") do
      with_tag('input#house_nom[name=?]', "house[nom]")
      with_tag('input#house_adresse[name=?]', "house[adresse]")
      with_tag('input#house_zip[name=?]', "house[zip]")
      with_tag('input#house_ville[name=?]', "house[ville]")
      with_tag('select#house_category_id[name=?]', "house[category_id]")
    end
  end
end


