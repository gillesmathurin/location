require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HousesController do

  def mock_house(stubs={})
    @mock_house ||= mock_model(House, stubs)
  end
  
  describe "Before_filters" do
    
    it "should have a before_filter which finds all the house categories available" do
      controller.class.before_filters.should include(:find_categories)
    end
    
    it "should have a before_filter which returns all the tarifs available" do
      controller.class.before_filters.should include(:find_tarifs)
    end
    
  end
  
  describe "GET index" do

    it "exposes all houses as @houses" do
      House.should_receive(:find).with(:all, {:order => 'position'}).and_return([mock_house])
      get :index
      assigns[:houses].should == [mock_house]
    end

    describe "with mime type of xml" do
  
      it "renders all houses as xml" do
        House.should_receive(:find).with(:all, {:order => 'position'}).and_return(houses = mock("Array of Houses"))
        houses.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do
    
    before(:each) do
      @locations_prox = mock('locations')
      @offre_promos_prox = mock('offre_promos')
    end

    it "exposes the requested house as @house, it's future reservation as @reservations" do
      House.should_receive(:find).with("37").and_return(mock_house)
      mock_house.should_receive(:locations).and_return(@locations_prox)
      @locations_prox.should_receive(:to_come)
      # may have to return the related offre_promos
      mock_house.stub!(:offre_promos).and_return(@offre_promos_prox)
      @offre_promos_prox.stub!(:empty?)
      @offre_promos_prox.stub!(:valid)
      get :show, :id => "37"
      assigns[:house].should equal(mock_house)
    end
    
    describe "with mime type of xml" do

      it "renders the requested house as xml" do
        House.should_receive(:find).with("37").and_return(mock_house)
        mock_house.should_receive(:locations).and_return(@locations_prox)
        @locations_prox.should_receive(:to_come)
        # may have to return the related offre_promos
        mock_house.stub!(:offre_promos).and_return(@offre_promos_prox)
        @offre_promos_prox.stub!(:empty?)
        @offre_promos_prox.stub!(:valid)
        
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
        mock_house.should_receive(:update_attributes).with({'these' => 'params', 'tarif_ids' => []})
        put :update, :id => "37", :house => {:these => 'params', :tarif_ids => []}
      end

      it "exposes the requested house as @house" do
        House.stub!(:find).and_return(mock_house(:update_attributes => true))
        put :update, :id => "1", :house => {:tarif_ids => []}
        assigns(:house).should equal(mock_house)
      end

      it "redirects to the house" do
        House.stub!(:find).and_return(mock_house(:update_attributes => true))
        put :update, :id => "1", :house => {:tarif_ids => []}
        response.should redirect_to(house_url(mock_house))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested house" do
        House.should_receive(:find).with("37").and_return(mock_house)
        mock_house.should_receive(:update_attributes).with({'these' => 'params', 'tarif_ids' => []})
        put :update, :id => "37", :house => {:these => 'params', :tarif_ids => []}
      end

      it "exposes the house as @house" do
        House.stub!(:find).and_return(mock_house(:update_attributes => false))
        put :update, :id => "1", :house => {:tarif_ids => []}
        assigns(:house).should equal(mock_house)
      end

      it "re-renders the 'edit' template" do
        House.stub!(:find).and_return(mock_house(:update_attributes => false))
        put :update, :id => "1", :house => {:tarif_ids => []}
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

  describe "POST search_availability" do
    
    describe "with valid params and an unavailable house" do
      
      before(:each) do
        @mock_locations = mock('locations')
        @mock_location = mock_model(Location)
      end
      
      def do_post
        post :search_availability, :id => "1", :date_debut => {:year => "2009", :month => "04", :day => "09"},
         :date_fin => {:year => "2009", :month => "05", :day => "09"}
      end
      
      it "should search for the given house's availability and display a negative answer" do
        House.should_receive(:find).with("1").and_return(mock_house)
        mock_house.should_receive(:locations).and_return(@mock_locations)
        @mock_locations.should_receive(:for_the_period).and_return([@mock_location])
        do_post
        response.should render_template('_notification')
        flash[:notification].should eql('Logement indisponible sur la période demandée.')
      end
    end
    
    describe "with valid params and a available house" do
      
      before(:each) do
        @mock_locations = mock('locations')
        @mock_location = []
      end
      
      def do_post
        post :search_availability, :id => "1", :date_debut => {:year => "2009", :month => "04", :day => "09"},
         :date_fin => {:year => "2009", :month => "05", :day => "09"}
      end
      
      it "should search for the given house's availability and display a positive answer" do
        House.should_receive(:find).with("1").and_return(mock_house)
        mock_house.should_receive(:locations).and_return(@mock_locations)
        @mock_locations.should_receive(:for_the_period).and_return([])
        do_post
        response.should render_template('_notification')
        flash[:notification].should eql('Logement disponible sur la période demandée.')
      end
      
    end
  end
end
