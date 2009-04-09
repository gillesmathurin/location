require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CustomersController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "customers", :action => "index").should == "/customers"
    end
  
    it "maps #new" do
      route_for(:controller => "customers", :action => "new").should == "/customers/new"
    end
  
    it "maps #show" do
      route_for(:controller => "customers", :action => "show", :id => "1").should == "/customers/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "customers", :action => "edit", :id => "1").should == "/customers/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "customers", :action => "create").should == {:path => "/customers", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "customers", :action => "update", :id => "1").should == {:path =>"/customers/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "customers", :action => "destroy", :id => "1").should == {:path =>"/customers/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/customers").should == {:controller => "customers", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/customers/new").should == {:controller => "customers", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/customers").should == {:controller => "customers", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/customers/1").should == {:controller => "customers", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/customers/1/edit").should == {:controller => "customers", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/customers/1").should == {:controller => "customers", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/customers/1").should == {:controller => "customers", :action => "destroy", :id => "1"}
    end
  end
end
