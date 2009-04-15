class OffrePromosController < ApplicationController
  # GET /offre_promos
  # GET /offre_promos.xml
  def index
    @offre_promos = OffrePromo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @offre_promos }
    end
  end

  # GET /offre_promos/1
  # GET /offre_promos/1.xml
  def show
    @offre_promo = OffrePromo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @offre_promo }
    end
  end

  # GET /offre_promos/new
  # GET /offre_promos/new.xml
  def new
    @offre_promo = OffrePromo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @offre_promo }
    end
  end

  # GET /offre_promos/1/edit
  def edit
    @offre_promo = OffrePromo.find(params[:id])
  end

  # POST /offre_promos
  # POST /offre_promos.xml
  def create
    @offre_promo = OffrePromo.new(params[:offre_promo])

    respond_to do |format|
      if @offre_promo.save
        flash[:notice] = 'OffrePromo was successfully created.'
        format.html { redirect_to(@offre_promo) }
        format.xml  { render :xml => @offre_promo, :status => :created, :location => @offre_promo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @offre_promo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /offre_promos/1
  # PUT /offre_promos/1.xml
  def update
    @offre_promo = OffrePromo.find(params[:id])

    respond_to do |format|
      if @offre_promo.update_attributes(params[:offre_promo])
        flash[:notice] = 'OffrePromo was successfully updated.'
        format.html { redirect_to(@offre_promo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @offre_promo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /offre_promos/1
  # DELETE /offre_promos/1.xml
  def destroy
    @offre_promo = OffrePromo.find(params[:id])
    @offre_promo.destroy

    respond_to do |format|
      format.html { redirect_to(offre_promos_url) }
      format.xml  { head :ok }
    end
  end
end
