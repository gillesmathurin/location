require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProspectsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "prospects", :action => "index").should == "/prospects"
    end
  
    it "maps #new" do
      route_for(:controller => "prospects", :action => "new").should == "/prospects/new"
    end
  
    it "maps #show" do
      route_for(:controller => "prospects", :action => "show", :id => "1").should == "/prospects/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "prospects", :action => "edit", :id => "1").should == "/prospects/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "prospects", :action => "create").should == {:path => "/prospects", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "prospects", :action => "update", :id => "1").should == {:path =>"/prospects/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "prospects", :action => "destroy", :id => "1").should == {:path =>"/prospects/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/prospects").should == {:controller => "prospects", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/prospects/new").should == {:controller => "prospects", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/prospects").should == {:controller => "prospects", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/prospects/1").should == {:controller => "prospects", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/prospects/1/edit").should == {:controller => "prospects", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/prospects/1").should == {:controller => "prospects", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/prospects/1").should == {:controller => "prospects", :action => "destroy", :id => "1"}
    end
  end
end
