require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/categories/edit.html.erb" do
  include CategoriesHelper
  
  before(:each) do
    assigns[:category] = @category = stub_model(Category,
      :new_record? => false,
      :nom => "value for nom"
    )
  end

  it "renders the edit category form" do
    render
    
    response.should have_tag("form[action=#{category_path(@category)}][method=post]") do
      with_tag('input#category_nom[name=?]', "category[nom]")
    end
  end
end


