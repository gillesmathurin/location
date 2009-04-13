require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProspectsController do

  def mock_prospect(stubs={})
    @mock_prospect ||= mock_model(Prospect, stubs)
  end
  
  describe "GET index" do

    it "exposes all prospects as @prospects" do
      Prospect.should_receive(:find).with(:all).and_return([mock_prospect])
      get :index
      assigns[:prospects].should == [mock_prospect]
    end

    describe "with mime type of xml" do
  
      it "renders all prospects as xml" do
        Prospect.should_receive(:find).with(:all).and_return(prospects = mock("Array of Prospects"))
        prospects.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested prospect as @prospect" do
      Prospect.should_receive(:find).with("37").and_return(mock_prospect)
      get :show, :id => "37"
      assigns[:prospect].should equal(mock_prospect)
    end
    
    describe "with mime type of xml" do

      it "renders the requested prospect as xml" do
        Prospect.should_receive(:find).with("37").and_return(mock_prospect)
        mock_prospect.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new prospect as @prospect" do
      Prospect.should_receive(:new).and_return(mock_prospect)
      get :new
      assigns[:prospect].should equal(mock_prospect)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested prospect as @prospect" do
      Prospect.should_receive(:find).with("37").and_return(mock_prospect)
      get :edit, :id => "37"
      assigns[:prospect].should equal(mock_prospect)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created prospect as @prospect" do
        Prospect.should_receive(:new).with({'these' => 'params'}).and_return(mock_prospect(:save => true))
        post :create, :prospect => {:these => 'params'}
        assigns(:prospect).should equal(mock_prospect)
      end

      it "redirects to the created prospect" do
        Prospect.stub!(:new).and_return(mock_prospect(:save => true))
        post :create, :prospect => {}
        response.should redirect_to(prospect_url(mock_prospect))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved prospect as @prospect" do
        Prospect.stub!(:new).with({'these' => 'params'}).and_return(mock_prospect(:save => false))
        post :create, :prospect => {:these => 'params'}
        assigns(:prospect).should equal(mock_prospect)
      end

      it "re-renders the 'new' template" do
        Prospect.stub!(:new).and_return(mock_prospect(:save => false))
        post :create, :prospect => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested prospect" do
        Prospect.should_receive(:find).with("37").and_return(mock_prospect)
        mock_prospect.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :prospect => {:these => 'params'}
      end

      it "exposes the requested prospect as @prospect" do
        Prospect.stub!(:find).and_return(mock_prospect(:update_attributes => true))
        put :update, :id => "1"
        assigns(:prospect).should equal(mock_prospect)
      end

      it "redirects to the prospect" do
        Prospect.stub!(:find).and_return(mock_prospect(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(prospect_url(mock_prospect))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested prospect" do
        Prospect.should_receive(:find).with("37").and_return(mock_prospect)
        mock_prospect.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :prospect => {:these => 'params'}
      end

      it "exposes the prospect as @prospect" do
        Prospect.stub!(:find).and_return(mock_prospect(:update_attributes => false))
        put :update, :id => "1"
        assigns(:prospect).should equal(mock_prospect)
      end

      it "re-renders the 'edit' template" do
        Prospect.stub!(:find).and_return(mock_prospect(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested prospect" do
      Prospect.should_receive(:find).with("37").and_return(mock_prospect)
      mock_prospect.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the prospects list" do
      Prospect.stub!(:find).and_return(mock_prospect(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(prospects_url)
    end

  end

end
