require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/prospects/edit.html.erb" do
  include ProspectsHelper
  
  before(:each) do
    assigns[:prospect] = @prospect = stub_model(Prospect,
      :new_record? => false,
      :nom => "value for nom",
      :prenom => "value for prenom",
      :email => "value for email",
      :telephone => "value for telephone",
      :fax => "value for fax"
    )
  end

  it "renders the edit prospect form" do
    render
    
    response.should have_tag("form[action=#{prospect_path(@prospect)}][method=post]") do
      with_tag('input#prospect_nom[name=?]', "prospect[nom]")
      with_tag('input#prospect_prenom[name=?]', "prospect[prenom]")
      with_tag('input#prospect_email[name=?]', "prospect[email]")
      with_tag('input#prospect_telephone[name=?]', "prospect[telephone]")
      with_tag('input#prospect_fax[name=?]', "prospect[fax]")
    end
  end
end


