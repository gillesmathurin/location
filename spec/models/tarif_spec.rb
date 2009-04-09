require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tarif do
  before(:each) do
    @valid_attributes = {
      :days_nb => 1,
      :price => 9.99,
      :nom => "value for nom"
    }
  end

  it "should create a new instance given valid attributes" do
    Tarif.create!(@valid_attributes)
  end
end
