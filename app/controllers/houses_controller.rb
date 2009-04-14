class HousesController < ApplicationController
  before_filter :find_categories, :find_tarifs
  
  # GET /houses
  # GET /houses.xml
  def index
    @houses = House.all(:order => 'position')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @houses }
    end
  end

  # GET /houses/1
  # GET /houses/1.xml
  def show
    @house = House.find(params[:id])
    @locations = @house.locations.to_come

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @house }
    end
  end

  # GET /houses/new
  # GET /houses/new.xml
  def new
    @house = House.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @house }
    end
  end

  # GET /houses/1/edit
  def edit
    @house = House.find(params[:id])
  end

  # POST /houses
  # POST /houses.xml
  def create
    @house = House.new(params[:house])

    respond_to do |format|
      if @house.save
        flash[:notice] = 'House was successfully created.'
        format.html { redirect_to(@house) }
        format.xml  { render :xml => @house, :status => :created, :location => @house }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @house.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /houses/1
  # PUT /houses/1.xml
  def update
    params[:house][:tarif_ids] ||= []
    @house = House.find(params[:id])

    respond_to do |format|
      if @house.update_attributes(params[:house])
        flash[:notice] = 'House was successfully updated.'
        format.html { redirect_to(@house) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @house.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def sort
    params[:houses].each_with_index do |id, index|
      House.update_all(['position = ?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
  def search_availability
    @house = House.find(params[:id])
    date_debut = params[:date_debut][:year]+"-"+params[:date_debut][:month]+"-"+params[:date_debut][:day]
    date_fin = params[:date_fin][:year]+"-"+params[:date_fin][:month]+"-"+params[:date_fin][:day]
    @locations = @house.locations.for_the_period(date_debut, date_fin)
    
    respond_to do |format|
      if @locations.empty?
        flash[:notice] = "Logement disponible sur la période demandée."
        format.html { render :partial => "notification", :locals => {:house => @house, :locations => @locations},
         :layout => false }
      else
        flash[:notice] = "Logement indisponible sur la période demandée."
        format.html { render :partial => "notification", :locals => {:house => @house, :locations => @locations},
         :layout => false }
      end
    end
  end
  
  # DELETE /houses/1
  # DELETE /houses/1.xml
  def destroy
    @house = House.find(params[:id])
    @house.destroy

    respond_to do |format|
      format.html { redirect_to(houses_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def find_categories
    @categories = Category.all
  end
  
  def find_tarifs
    @tarifs = Tarif.all   
  end
end
