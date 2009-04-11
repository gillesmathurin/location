require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LocationsController do

  def mock_location(stubs={})
    @mock_location ||= mock_model(Location, stubs)
  end
  
  describe "GET index" do

    it "exposes all locations as @locations" do
      Location.should_receive(:find).with(:all).and_return([mock_location])
      get :index
      assigns[:locations].should == [mock_location]
    end

    describe "with mime type of xml" do
  
      it "renders all locations as xml" do
        Location.should_receive(:find).with(:all).and_return(locations = mock("Array of Locations"))
        locations.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested location as @location" do
      Location.should_receive(:find).with("37").and_return(mock_location)
      get :show, :id => "37"
      assigns[:location].should equal(mock_location)
    end
    
    describe "with mime type of xml" do

      it "renders the requested location as xml" do
        Location.should_receive(:find).with("37").and_return(mock_location)
        mock_location.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new location as @location" do
      Location.should_receive(:new).and_return(mock_location)
      get :new
      assigns[:location].should equal(mock_location)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested location as @location" do
      Location.should_receive(:find).with("37").and_return(mock_location)
      get :edit, :id => "37"
      assigns[:location].should equal(mock_location)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created location as @location" do
        Location.should_receive(:new).with({'these' => 'params'}).and_return(mock_location(:save => true))
        post :create, :location => {:these => 'params'}
        assigns(:location).should equal(mock_location)
      end

      it "redirects to the created location" do
        Location.stub!(:new).and_return(mock_location(:save => true))
        post :create, :location => {}
        response.should redirect_to(location_url(mock_location))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved location as @location" do
        Location.stub!(:new).with({'these' => 'params'}).and_return(mock_location(:save => false))
        post :create, :location => {:these => 'params'}
        assigns(:location).should equal(mock_location)
      end

      it "re-renders the 'new' template" do
        Location.stub!(:new).and_return(mock_location(:save => false))
        post :create, :location => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested location" do
        Location.should_receive(:find).with("37").and_return(mock_location)
        mock_location.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :location => {:these => 'params'}
      end

      it "exposes the requested location as @location" do
        Location.stub!(:find).and_return(mock_location(:update_attributes => true))
        put :update, :id => "1"
        assigns(:location).should equal(mock_location)
      end

      it "redirects to the location" do
        Location.stub!(:find).and_return(mock_location(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(location_url(mock_location))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested location" do
        Location.should_receive(:find).with("37").and_return(mock_location)
        mock_location.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :location => {:these => 'params'}
      end

      it "exposes the location as @location" do
        Location.stub!(:find).and_return(mock_location(:update_attributes => false))
        put :update, :id => "1"
        assigns(:location).should equal(mock_location)
      end

      it "re-renders the 'edit' template" do
        Location.stub!(:find).and_return(mock_location(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested location" do
      Location.should_receive(:find).with("37").and_return(mock_location)
      mock_location.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the locations list" do
      Location.stub!(:find).and_return(mock_location(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(locations_url)
    end

  end

end