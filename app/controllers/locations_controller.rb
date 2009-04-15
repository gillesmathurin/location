class LocationsController < ApplicationController
  before_filter :find_house
  before_filter :login_required, :only => [:new, :edit, :create, :update, :destroy]
  
  # GET /locations
  # GET /locations.xml
  def index
    if @house
      @locations = @house.locations.paginate :all, :page => params[:page], :per_page => 20, :order => 'date_debut desc'
    else
      @locations = Location.paginate :all, :page => params[:page], :per_page => 20, :order => 'date_debut desc'
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    if @house
      @location = @house.locations.build(:house_id => @house.id)
    else
      @location = Location.new()
    end
    
    @customer = @location.build_customer

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
    @customer = @location.customer
  end

  # POST /locations
  # POST /locations.xml
  def create
    @location = Location.new(params[:location])
    @location.house = @house

    respond_to do |format|
      if @location.save
        flash[:notice] = 'Location was successfully created.'
        format.html { redirect_to(@location) }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        flash[:notice] = 'Location was successfully updated.'
        format.html { redirect_to(@location) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # POST
  def search
    date_debut = params[:date_debut][:year]+"-"+params[:date_debut][:month]+"-"+params[:date_debut][:day]
    date_fin = params[:date_fin][:year]+"-"+params[:date_fin][:month]+"-"+params[:date_fin][:day]
    
    @locations = Location.for_the_period(date_debut, date_fin)
    
    respond_to do |format|
      format.html { render :partial => "_listing", :collections => @locations, :layout => false }
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def find_house
    @house = House.find(params[:house_id]) if params[:house_id]
  end
end
