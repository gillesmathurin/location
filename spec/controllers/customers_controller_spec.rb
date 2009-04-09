require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CustomersController do

  def mock_customer(stubs={})
    @mock_customer ||= mock_model(Customer, stubs)
  end
  
  describe "GET index" do

    it "exposes all customers as @customers" do
      Customer.should_receive(:find).with(:all).and_return([mock_customer])
      get :index
      assigns[:customers].should == [mock_customer]
    end

    describe "with mime type of xml" do
  
      it "renders all customers as xml" do
        Customer.should_receive(:find).with(:all).and_return(customers = mock("Array of Customers"))
        customers.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested customer as @customer" do
      Customer.should_receive(:find).with("37").and_return(mock_customer)
      get :show, :id => "37"
      assigns[:customer].should equal(mock_customer)
    end
    
    describe "with mime type of xml" do

      it "renders the requested customer as xml" do
        Customer.should_receive(:find).with("37").and_return(mock_customer)
        mock_customer.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new customer as @customer" do
      Customer.should_receive(:new).and_return(mock_customer)
      get :new
      assigns[:customer].should equal(mock_customer)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested customer as @customer" do
      Customer.should_receive(:find).with("37").and_return(mock_customer)
      get :edit, :id => "37"
      assigns[:customer].should equal(mock_customer)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created customer as @customer" do
        Customer.should_receive(:new).with({'these' => 'params'}).and_return(mock_customer(:save => true))
        post :create, :customer => {:these => 'params'}
        assigns(:customer).should equal(mock_customer)
      end

      it "redirects to the created customer" do
        Customer.stub!(:new).and_return(mock_customer(:save => true))
        post :create, :customer => {}
        response.should redirect_to(customer_url(mock_customer))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved customer as @customer" do
        Customer.stub!(:new).with({'these' => 'params'}).and_return(mock_customer(:save => false))
        post :create, :customer => {:these => 'params'}
        assigns(:customer).should equal(mock_customer)
      end

      it "re-renders the 'new' template" do
        Customer.stub!(:new).and_return(mock_customer(:save => false))
        post :create, :customer => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested customer" do
        Customer.should_receive(:find).with("37").and_return(mock_customer)
        mock_customer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :customer => {:these => 'params'}
      end

      it "exposes the requested customer as @customer" do
        Customer.stub!(:find).and_return(mock_customer(:update_attributes => true))
        put :update, :id => "1"
        assigns(:customer).should equal(mock_customer)
      end

      it "redirects to the customer" do
        Customer.stub!(:find).and_return(mock_customer(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(customer_url(mock_customer))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested customer" do
        Customer.should_receive(:find).with("37").and_return(mock_customer)
        mock_customer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :customer => {:these => 'params'}
      end

      it "exposes the customer as @customer" do
        Customer.stub!(:find).and_return(mock_customer(:update_attributes => false))
        put :update, :id => "1"
        assigns(:customer).should equal(mock_customer)
      end

      it "re-renders the 'edit' template" do
        Customer.stub!(:find).and_return(mock_customer(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested customer" do
      Customer.should_receive(:find).with("37").and_return(mock_customer)
      mock_customer.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the customers list" do
      Customer.stub!(:find).and_return(mock_customer(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(customers_url)
    end

  end

end
