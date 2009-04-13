require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Prospect do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :prenom => "value for prenom",
      :email => "value for email",
      :telephone => "value for telephone",
      :fax => "value for fax"
    }
  end

  it "should create a new instance given valid attributes" do
    Prospect.create!(@valid_attributes)
  end
end
