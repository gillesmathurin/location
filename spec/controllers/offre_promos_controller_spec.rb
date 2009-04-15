require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OffrePromosController do

  def mock_offre_promo(stubs={})
    @mock_offre_promo ||= mock_model(OffrePromo, stubs)
  end
  
  describe "GET index" do

    it "exposes all offre_promos as @offre_promos" do
      OffrePromo.should_receive(:find).with(:all).and_return([mock_offre_promo])
      get :index
      assigns[:offre_promos].should == [mock_offre_promo]
    end

    describe "with mime type of xml" do
  
      it "renders all offre_promos as xml" do
        OffrePromo.should_receive(:find).with(:all).and_return(offre_promos = mock("Array of OffrePromos"))
        offre_promos.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested offre_promo as @offre_promo" do
      OffrePromo.should_receive(:find).with("37").and_return(mock_offre_promo)
      get :show, :id => "37"
      assigns[:offre_promo].should equal(mock_offre_promo)
    end
    
    describe "with mime type of xml" do

      it "renders the requested offre_promo as xml" do
        OffrePromo.should_receive(:find).with("37").and_return(mock_offre_promo)
        mock_offre_promo.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new offre_promo as @offre_promo" do
      OffrePromo.should_receive(:new).and_return(mock_offre_promo)
      get :new
      assigns[:offre_promo].should equal(mock_offre_promo)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested offre_promo as @offre_promo" do
      OffrePromo.should_receive(:find).with("37").and_return(mock_offre_promo)
      get :edit, :id => "37"
      assigns[:offre_promo].should equal(mock_offre_promo)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created offre_promo as @offre_promo" do
        OffrePromo.should_receive(:new).with({'these' => 'params'}).and_return(mock_offre_promo(:save => true))
        post :create, :offre_promo => {:these => 'params'}
        assigns(:offre_promo).should equal(mock_offre_promo)
      end

      it "redirects to the created offre_promo" do
        OffrePromo.stub!(:new).and_return(mock_offre_promo(:save => true))
        post :create, :offre_promo => {}
        response.should redirect_to(offre_promo_url(mock_offre_promo))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved offre_promo as @offre_promo" do
        OffrePromo.stub!(:new).with({'these' => 'params'}).and_return(mock_offre_promo(:save => false))
        post :create, :offre_promo => {:these => 'params'}
        assigns(:offre_promo).should equal(mock_offre_promo)
      end

      it "re-renders the 'new' template" do
        OffrePromo.stub!(:new).and_return(mock_offre_promo(:save => false))
        post :create, :offre_promo => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested offre_promo" do
        OffrePromo.should_receive(:find).with("37").and_return(mock_offre_promo)
        mock_offre_promo.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :offre_promo => {:these => 'params'}
      end

      it "exposes the requested offre_promo as @offre_promo" do
        OffrePromo.stub!(:find).and_return(mock_offre_promo(:update_attributes => true))
        put :update, :id => "1"
        assigns(:offre_promo).should equal(mock_offre_promo)
      end

      it "redirects to the offre_promo" do
        OffrePromo.stub!(:find).and_return(mock_offre_promo(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(offre_promo_url(mock_offre_promo))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested offre_promo" do
        OffrePromo.should_receive(:find).with("37").and_return(mock_offre_promo)
        mock_offre_promo.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :offre_promo => {:these => 'params'}
      end

      it "exposes the offre_promo as @offre_promo" do
        OffrePromo.stub!(:find).and_return(mock_offre_promo(:update_attributes => false))
        put :update, :id => "1"
        assigns(:offre_promo).should equal(mock_offre_promo)
      end

      it "re-renders the 'edit' template" do
        OffrePromo.stub!(:find).and_return(mock_offre_promo(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested offre_promo" do
      OffrePromo.should_receive(:find).with("37").and_return(mock_offre_promo)
      mock_offre_promo.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the offre_promos list" do
      OffrePromo.stub!(:find).and_return(mock_offre_promo(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(offre_promos_url)
    end

  end

end
