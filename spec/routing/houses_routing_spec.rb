require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HousesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "houses", :action => "index").should == "/houses"
    end
  
    it "maps #new" do
      route_for(:controller => "houses", :action => "new").should == "/houses/new"
    end
  
    it "maps #show" do
      route_for(:controller => "houses", :action => "show", :id => "1").should == "/houses/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "houses", :action => "edit", :id => "1").should == "/houses/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "houses", :action => "create").should == {:path => "/houses", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "houses", :action => "update", :id => "1").should == {:path =>"/houses/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "houses", :action => "destroy", :id => "1").should == {:path =>"/houses/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/houses").should == {:controller => "houses", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/houses/new").should == {:controller => "houses", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/houses").should == {:controller => "houses", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/houses/1").should == {:controller => "houses", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/houses/1/edit").should == {:controller => "houses", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/houses/1").should == {:controller => "houses", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/houses/1").should == {:controller => "houses", :action => "destroy", :id => "1"}
    end
  end
end
