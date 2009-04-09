require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe House do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :adresse => "value for adresse",
      :zip => "value for zip",
      :ville => "value for ville",
      :category_id => 1,
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    House.create!(@valid_attributes)
  end
end
