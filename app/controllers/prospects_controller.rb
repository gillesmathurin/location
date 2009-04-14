class ProspectsController < ApplicationController
  # GET /prospects
  # GET /prospects.xml
  def index
    @prospects = Prospect.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prospects }
    end
  end

  # GET /prospects/1
  # GET /prospects/1.xml
  def show
    @prospect = Prospect.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prospect }
    end
  end

  # GET /prospects/new
  # GET /prospects/new.xml
  def new
    date_debut = params_to_date(params[:date_debut]) if params[:date_debut]  
    date_fin = params_to_date(params[:date_fin]) if params[:date_fin] 
    
    @prospect = Prospect.new(:house_id => params[:house_id], :date_debut => date_debut, :date_fin => date_fin)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prospect }
    end
  end

  # GET /prospects/1/edit
  def edit
    @prospect = Prospect.find(params[:id])
  end

  # POST /prospects
  # POST /prospects.xml
  def create
    @prospect = Prospect.new(params[:prospect])

    respond_to do |format|
      if @prospect.save
        ReservationMailer.deliver_sent(@prospect, @prospect.house)
        flash[:notice] = "Votre demande d'informations a été pris en compte."
        format.html { redirect_to(house_path(@prospect.house)) }
        format.xml  { render :xml => @prospect, :status => :created, :location => @prospect }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prospect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prospects/1
  # PUT /prospects/1.xml
  def update
    @prospect = Prospect.find(params[:id])

    respond_to do |format|
      if @prospect.update_attributes(params[:prospect])
        flash[:notice] = 'Prospect was successfully updated.'
        format.html { redirect_to(@prospect) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prospect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prospects/1
  # DELETE /prospects/1.xml
  def destroy
    @prospect = Prospect.find(params[:id])
    @prospect.destroy

    respond_to do |format|
      format.html { redirect_to(prospects_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def params_to_date(params = "")
    params[:year]+"-"+params[:month]+"-"+params[:day]
  end
end
