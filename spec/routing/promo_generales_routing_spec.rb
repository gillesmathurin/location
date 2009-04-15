require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PromoGeneralesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "promo_generales", :action => "index").should == "/promo_generales"
    end
  
    it "maps #new" do
      route_for(:controller => "promo_generales", :action => "new").should == "/promo_generales/new"
    end
  
    it "maps #show" do
      route_for(:controller => "promo_generales", :action => "show", :id => "1").should == "/promo_generales/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "promo_generales", :action => "edit", :id => "1").should == "/promo_generales/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "promo_generales", :action => "create").should == {:path => "/promo_generales", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "promo_generales", :action => "update", :id => "1").should == {:path =>"/promo_generales/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "promo_generales", :action => "destroy", :id => "1").should == {:path =>"/promo_generales/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/promo_generales").should == {:controller => "promo_generales", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/promo_generales/new").should == {:controller => "promo_generales", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/promo_generales").should == {:controller => "promo_generales", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/promo_generales/1").should == {:controller => "promo_generales", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/promo_generales/1/edit").should == {:controller => "promo_generales", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/promo_generales/1").should == {:controller => "promo_generales", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/promo_generales/1").should == {:controller => "promo_generales", :action => "destroy", :id => "1"}
    end
  end
end
