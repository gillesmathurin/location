require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/houses/new.html.erb" do
  include HousesHelper
  
  before(:each) do
    assigns[:house] = stub_model(House,
      :new_record? => true,
      :nom => "value for nom",
      :adresse => "value for adresse",
      :zip => "value for zip",
      :ville => "value for ville",
      :category_id => 1,
      :user_id => 1
    )
    assigns[:categories] = @categories = [mock_model(Category, :nom => "value for nom")]
  end

  it "renders new house form" do
    render
    
    response.should have_tag("form[action=?][method=post]", houses_path) do
      with_tag("input#house_nom[name=?]", "house[nom]")
      with_tag("input#house_adresse[name=?]", "house[adresse]")
      with_tag("input#house_zip[name=?]", "house[zip]")
      with_tag("input#house_ville[name=?]", "house[ville]")
      with_tag('select#house_category_id[name=?]', "house[category_id]")
    end
  end
end


