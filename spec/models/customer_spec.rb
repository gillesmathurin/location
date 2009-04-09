require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Customer do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :prenom => "value for prenom",
      :adresse => "value for adresse",
      :zip => "value for zip",
      :ville => "value for ville",
      :telephone => "value for telephone",
      :email => "value for email",
      :fax => "value for fax"
    }
  end

  it "should create a new instance given valid attributes" do
    Customer.create!(@valid_attributes)
  end
end
