require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HousesController do

  def mock_house(stubs={})
    @mock_house ||= mock_model(House, stubs)
  end
  
  describe "Before_filter find_categories" do
    
    before(:each) do
      @category = mock_model(Category)
      @categories = [@category]
    end
    
    it "should have a before_filter which finds all the house categories available" do
      controller.class.before_filters.should include(:find_categories)
    end
    
    it "should find all the categories and assign them to @categories symbol" do
      get :index
      assigns[:categories].should eql(@categories)
    end
    
  end
  
  describe "GET index" do

    it "exposes all houses as @houses" do
      House.should_receive(:find).with(:all).and_return([mock_house])
      get :index
      assigns[:houses].should == [mock_house]
    end

    describe "with mime type of xml" do
  
      it "renders all houses as xml" do
        House.should_receive(:find).with(:all).and_return(houses = mock("Array of Houses"))
        houses.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested house as @house" do
      House.should_receive(:find).with("37").and_return(mock_house)
      get :show, :id => "37"
      assigns[:house].should equal(mock_house)
    end
    
    describe "with mime type of xml" do

      it "renders the requested house as xml" do
        House.should_receive(:find).with("37").and_return(mock_house)
        mock_house.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new house as @house" do
      House.should_receive(:new).and_return(mock_house)
      get :new
      assigns[:house].should equal(mock_house)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested house as @house" do
      House.should_receive(:find).with("37").and_return(mock_house)
      get :edit, :id => "37"
      assigns[:house].should equal(mock_house)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created house as @house" do
        House.should_receive(:new).with({'these' => 'params'}).and_return(mock_house(:save => true))
        post :create, :house => {:these => 'params'}
        assigns(:house).should equal(mock_house)
      end

      it "redirects to the created house" do
        House.stub!(:new).and_return(mock_house(:save => true))
        post :create, :house => {}
        response.should redirect_to(house_url(mock_house))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved house as @house" do
        House.stub!(:new).with({'these' => 'params'}).and_return(mock_house(:save => false))
        post :create, :house => {:these => 'params'}
        assigns(:house).should equal(mock_house)
      end

      it "re-renders the 'new' template" do
        House.stub!(:new).and_return(mock_house(:save => false))
        post :create, :house => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested house" do
        House.should_receive(:find).with("37").and_return(mock_house)
        mock_house.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :house => {:these => 'params'}
      end

      it "exposes the requested house as @house" do
        House.stub!(:find).and_return(mock_house(:update_attributes => true))
        put :update, :id => "1"
        assigns(:house).should equal(mock_house)
      end

      it "redirects to the house" do
        House.stub!(:find).and_return(mock_house(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(house_url(mock_house))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested house" do
        House.should_receive(:find).with("37").and_return(mock_house)
        mock_house.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :house => {:these => 'params'}
      end

      it "exposes the house as @house" do
        House.stub!(:find).and_return(mock_house(:update_attributes => false))
        put :update, :id => "1"
        assigns(:house).should equal(mock_house)
      end

      it "re-renders the 'edit' template" do
        House.stub!(:find).and_return(mock_house(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested house" do
      House.should_receive(:find).with("37").and_return(mock_house)
      mock_house.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the houses list" do
      House.stub!(:find).and_return(mock_house(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(houses_url)
    end

  end

end
