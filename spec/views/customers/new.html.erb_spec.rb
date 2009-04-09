require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/customers/new.html.erb" do
  include CustomersHelper
  
  before(:each) do
    assigns[:customer] = stub_model(Customer,
      :new_record? => true,
      :nom => "value for nom",
      :prenom => "value for prenom",
      :adresse => "value for adresse",
      :zip => "value for zip",
      :ville => "value for ville",
      :telephone => "value for telephone",
      :email => "value for email",
      :fax => "value for fax"
    )
  end

  it "renders new customer form" do
    render
    
    response.should have_tag("form[action=?][method=post]", customers_path) do
      with_tag("input#customer_nom[name=?]", "customer[nom]")
      with_tag("input#customer_prenom[name=?]", "customer[prenom]")
      with_tag("input#customer_adresse[name=?]", "customer[adresse]")
      with_tag("input#customer_zip[name=?]", "customer[zip]")
      with_tag("input#customer_ville[name=?]", "customer[ville]")
      with_tag("input#customer_telephone[name=?]", "customer[telephone]")
      with_tag("input#customer_email[name=?]", "customer[email]")
      with_tag("input#customer_fax[name=?]", "customer[fax]")
    end
  end
end


