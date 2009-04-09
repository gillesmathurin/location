require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/categories/index.html.erb" do
  include CategoriesHelper
  
  before(:each) do
    assigns[:categories] = [
      stub_model(Category,
        :nom => "value for nom"
      ),
      stub_model(Category,
        :nom => "value for nom"
      )
    ]
  end

  it "renders a list of categories" do
    render
    response.should have_tag("tr>td", "value for nom".to_s, 2)
  end
end

