require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/categories/new.html.erb" do
  include CategoriesHelper
  
  before(:each) do
    assigns[:category] = stub_model(Category,
      :new_record? => true,
      :nom => "value for nom"
    )
  end

  it "renders new category form" do
    render
    
    response.should have_tag("form[action=?][method=post]", categories_path) do
      with_tag("input#category_nom[name=?]", "category[nom]")
    end
  end
end


