require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PromoGenerale do
  before(:each) do
    @valid_attributes = {
      :titre => "value for titre",
      :description => "value for description",
      :date_debut => Date.today,
      :date_fin => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    PromoGenerale.create!(@valid_attributes)
  end
end
