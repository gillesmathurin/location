require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Location do
  before(:each) do
    @valid_attributes = {
      :house_id => 1,
      :date_debut => Date.today,
      :date_fin => Date.today,
      :customer_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Location.create!(@valid_attributes)
  end
end

describe Location, ".for_the_period(date_debut, date_fin)" do
  fixtures :locations
  
  context "with existing locations in the desired period" do
    before(:each) do
      @location = locations(:one)
      @date_1 = "2009-04-11"
      @date_2 = "2009-04-30"
    end

    it "should find the locations record" do
      @locations = Location.for_the_period(@date_1, @date_2)
      @locations.should_not be_empty
    end
  end
  
  context "with no existing locations in the desired period" do
    before(:each) do
      @location = locations(:two)
      @date_1 = "2009-06-11"
      @date_2 = "2009-07-30"
    end
    
    it "should find no record and return an empty array" do
      @locations = Location.for_the_period(@date_1, @date_2)
      @locations.should be_empty
      @locations.should eql([])
    end
  end

end

describe Location, ".calculate_price()" do
  fixtures :houses, :locations, :tarifs
  
  context "with a location of max than 7 days" do
    
    before(:each) do
      @house = houses(:one)
      @location = locations(:one)
    end
    
    it "should calculate the estimate accordingly to the duration with the correct price" do
      # @location.calculate_price.should eql(315.0)
      # @location.estimate.should_not be_empty
    end
  end
  
  context "with a location between 7 and 30 days" do
    
    before(:each) do
      @house = houses(:one)
      @location = locations(:two)
    end
    
    it "should calculate the estimate accordingly to the duration with the 'hebdomadaire' price" do
      # @location.calculate_price.should > 600.0
      # @location.calculate_price.should < 1150.0
      # @location.estimate.should_not be_empty
    end
  end
  
  context "with a location of more than 30 days" do
    
    before(:each) do
      @house = houses(:one)
      @location = locations(:three)
    end
    
    it "should calculate an estimate accordingly to the duration with the 'mensuel' price" do
      # @location.calculate_price.should > 1150.0
      # @location.estimate.should_not be_empty
    end
  end
  
end