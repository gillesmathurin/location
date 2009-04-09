require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TarifsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "tarifs", :action => "index").should == "/tarifs"
    end
  
    it "maps #new" do
      route_for(:controller => "tarifs", :action => "new").should == "/tarifs/new"
    end
  
    it "maps #show" do
      route_for(:controller => "tarifs", :action => "show", :id => "1").should == "/tarifs/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "tarifs", :action => "edit", :id => "1").should == "/tarifs/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "tarifs", :action => "create").should == {:path => "/tarifs", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "tarifs", :action => "update", :id => "1").should == {:path =>"/tarifs/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "tarifs", :action => "destroy", :id => "1").should == {:path =>"/tarifs/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/tarifs").should == {:controller => "tarifs", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/tarifs/new").should == {:controller => "tarifs", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/tarifs").should == {:controller => "tarifs", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/tarifs/1").should == {:controller => "tarifs", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/tarifs/1/edit").should == {:controller => "tarifs", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/tarifs/1").should == {:controller => "tarifs", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/tarifs/1").should == {:controller => "tarifs", :action => "destroy", :id => "1"}
    end
  end
end
