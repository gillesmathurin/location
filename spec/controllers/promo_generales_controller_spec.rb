require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PromoGeneralesController do

  def mock_promo_generale(stubs={})
    @mock_promo_generale ||= mock_model(PromoGenerale, stubs)
  end
  
  describe "GET index" do

    it "exposes all promo_generales as @promo_generales" do
      PromoGenerale.should_receive(:find).with(:all).and_return([mock_promo_generale])
      get :index
      assigns[:promo_generales].should == [mock_promo_generale]
    end

    describe "with mime type of xml" do
  
      it "renders all promo_generales as xml" do
        PromoGenerale.should_receive(:find).with(:all).and_return(promo_generales = mock("Array of PromoGenerales"))
        promo_generales.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested promo_generale as @promo_generale" do
      PromoGenerale.should_receive(:find).with("37").and_return(mock_promo_generale)
      get :show, :id => "37"
      assigns[:promo_generale].should equal(mock_promo_generale)
    end
    
    describe "with mime type of xml" do

      it "renders the requested promo_generale as xml" do
        PromoGenerale.should_receive(:find).with("37").and_return(mock_promo_generale)
        mock_promo_generale.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new promo_generale as @promo_generale" do
      PromoGenerale.should_receive(:new).and_return(mock_promo_generale)
      get :new
      assigns[:promo_generale].should equal(mock_promo_generale)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested promo_generale as @promo_generale" do
      PromoGenerale.should_receive(:find).with("37").and_return(mock_promo_generale)
      get :edit, :id => "37"
      assigns[:promo_generale].should equal(mock_promo_generale)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created promo_generale as @promo_generale" do
        PromoGenerale.should_receive(:new).with({'these' => 'params'}).and_return(mock_promo_generale(:save => true))
        post :create, :promo_generale => {:these => 'params'}
        assigns(:promo_generale).should equal(mock_promo_generale)
      end

      it "redirects to the created promo_generale" do
        PromoGenerale.stub!(:new).and_return(mock_promo_generale(:save => true))
        post :create, :promo_generale => {}
        response.should redirect_to(promo_generale_url(mock_promo_generale))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved promo_generale as @promo_generale" do
        PromoGenerale.stub!(:new).with({'these' => 'params'}).and_return(mock_promo_generale(:save => false))
        post :create, :promo_generale => {:these => 'params'}
        assigns(:promo_generale).should equal(mock_promo_generale)
      end

      it "re-renders the 'new' template" do
        PromoGenerale.stub!(:new).and_return(mock_promo_generale(:save => false))
        post :create, :promo_generale => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested promo_generale" do
        PromoGenerale.should_receive(:find).with("37").and_return(mock_promo_generale)
        mock_promo_generale.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :promo_generale => {:these => 'params'}
      end

      it "exposes the requested promo_generale as @promo_generale" do
        PromoGenerale.stub!(:find).and_return(mock_promo_generale(:update_attributes => true))
        put :update, :id => "1"
        assigns(:promo_generale).should equal(mock_promo_generale)
      end

      it "redirects to the promo_generale" do
        PromoGenerale.stub!(:find).and_return(mock_promo_generale(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(promo_generale_url(mock_promo_generale))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested promo_generale" do
        PromoGenerale.should_receive(:find).with("37").and_return(mock_promo_generale)
        mock_promo_generale.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :promo_generale => {:these => 'params'}
      end

      it "exposes the promo_generale as @promo_generale" do
        PromoGenerale.stub!(:find).and_return(mock_promo_generale(:update_attributes => false))
        put :update, :id => "1"
        assigns(:promo_generale).should equal(mock_promo_generale)
      end

      it "re-renders the 'edit' template" do
        PromoGenerale.stub!(:find).and_return(mock_promo_generale(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested promo_generale" do
      PromoGenerale.should_receive(:find).with("37").and_return(mock_promo_generale)
      mock_promo_generale.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the promo_generales list" do
      PromoGenerale.stub!(:find).and_return(mock_promo_generale(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(promo_generales_url)
    end

  end

end
