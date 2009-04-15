require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OffrePromosController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "offre_promos", :action => "index").should == "/offre_promos"
    end
  
    it "maps #new" do
      route_for(:controller => "offre_promos", :action => "new").should == "/offre_promos/new"
    end
  
    it "maps #show" do
      route_for(:controller => "offre_promos", :action => "show", :id => "1").should == "/offre_promos/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "offre_promos", :action => "edit", :id => "1").should == "/offre_promos/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "offre_promos", :action => "create").should == {:path => "/offre_promos", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "offre_promos", :action => "update", :id => "1").should == {:path =>"/offre_promos/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "offre_promos", :action => "destroy", :id => "1").should == {:path =>"/offre_promos/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/offre_promos").should == {:controller => "offre_promos", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/offre_promos/new").should == {:controller => "offre_promos", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/offre_promos").should == {:controller => "offre_promos", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/offre_promos/1").should == {:controller => "offre_promos", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/offre_promos/1/edit").should == {:controller => "offre_promos", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/offre_promos/1").should == {:controller => "offre_promos", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/offre_promos/1").should == {:controller => "offre_promos", :action => "destroy", :id => "1"}
    end
  end
end
