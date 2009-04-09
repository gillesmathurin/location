require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TarifsController do

  def mock_tarif(stubs={})
    @mock_tarif ||= mock_model(Tarif, stubs)
  end
  
  describe "GET index" do

    it "exposes all tarifs as @tarifs" do
      Tarif.should_receive(:find).with(:all).and_return([mock_tarif])
      get :index
      assigns[:tarifs].should == [mock_tarif]
    end

    describe "with mime type of xml" do
  
      it "renders all tarifs as xml" do
        Tarif.should_receive(:find).with(:all).and_return(tarifs = mock("Array of Tarifs"))
        tarifs.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested tarif as @tarif" do
      Tarif.should_receive(:find).with("37").and_return(mock_tarif)
      get :show, :id => "37"
      assigns[:tarif].should equal(mock_tarif)
    end
    
    describe "with mime type of xml" do

      it "renders the requested tarif as xml" do
        Tarif.should_receive(:find).with("37").and_return(mock_tarif)
        mock_tarif.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new tarif as @tarif" do
      Tarif.should_receive(:new).and_return(mock_tarif)
      get :new
      assigns[:tarif].should equal(mock_tarif)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested tarif as @tarif" do
      Tarif.should_receive(:find).with("37").and_return(mock_tarif)
      get :edit, :id => "37"
      assigns[:tarif].should equal(mock_tarif)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created tarif as @tarif" do
        Tarif.should_receive(:new).with({'these' => 'params'}).and_return(mock_tarif(:save => true))
        post :create, :tarif => {:these => 'params'}
        assigns(:tarif).should equal(mock_tarif)
      end

      it "redirects to the created tarif" do
        Tarif.stub!(:new).and_return(mock_tarif(:save => true))
        post :create, :tarif => {}
        response.should redirect_to(tarif_url(mock_tarif))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved tarif as @tarif" do
        Tarif.stub!(:new).with({'these' => 'params'}).and_return(mock_tarif(:save => false))
        post :create, :tarif => {:these => 'params'}
        assigns(:tarif).should equal(mock_tarif)
      end

      it "re-renders the 'new' template" do
        Tarif.stub!(:new).and_return(mock_tarif(:save => false))
        post :create, :tarif => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested tarif" do
        Tarif.should_receive(:find).with("37").and_return(mock_tarif)
        mock_tarif.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tarif => {:these => 'params'}
      end

      it "exposes the requested tarif as @tarif" do
        Tarif.stub!(:find).and_return(mock_tarif(:update_attributes => true))
        put :update, :id => "1"
        assigns(:tarif).should equal(mock_tarif)
      end

      it "redirects to the tarif" do
        Tarif.stub!(:find).and_return(mock_tarif(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(tarif_url(mock_tarif))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested tarif" do
        Tarif.should_receive(:find).with("37").and_return(mock_tarif)
        mock_tarif.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tarif => {:these => 'params'}
      end

      it "exposes the tarif as @tarif" do
        Tarif.stub!(:find).and_return(mock_tarif(:update_attributes => false))
        put :update, :id => "1"
        assigns(:tarif).should equal(mock_tarif)
      end

      it "re-renders the 'edit' template" do
        Tarif.stub!(:find).and_return(mock_tarif(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested tarif" do
      Tarif.should_receive(:find).with("37").and_return(mock_tarif)
      mock_tarif.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the tarifs list" do
      Tarif.stub!(:find).and_return(mock_tarif(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(tarifs_url)
    end

  end

end
