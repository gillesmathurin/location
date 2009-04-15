class PromoGeneralesController < ApplicationController
  # GET /promo_generales
  # GET /promo_generales.xml
  def index
    @promo_generales = PromoGenerale.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @promo_generales }
    end
  end

  # GET /promo_generales/1
  # GET /promo_generales/1.xml
  def show
    @promo_generale = PromoGenerale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @promo_generale }
    end
  end

  # GET /promo_generales/new
  # GET /promo_generales/new.xml
  def new
    @promo_generale = PromoGenerale.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @promo_generale }
    end
  end

  # GET /promo_generales/1/edit
  def edit
    @promo_generale = PromoGenerale.find(params[:id])
  end

  # POST /promo_generales
  # POST /promo_generales.xml
  def create
    @promo_generale = PromoGenerale.new(params[:promo_generale])

    respond_to do |format|
      if @promo_generale.save
        flash[:notice] = 'PromoGenerale was successfully created.'
        format.html { redirect_to(@promo_generale) }
        format.xml  { render :xml => @promo_generale, :status => :created, :location => @promo_generale }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @promo_generale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /promo_generales/1
  # PUT /promo_generales/1.xml
  def update
    @promo_generale = PromoGenerale.find(params[:id])

    respond_to do |format|
      if @promo_generale.update_attributes(params[:promo_generale])
        flash[:notice] = 'PromoGenerale was successfully updated.'
        format.html { redirect_to(@promo_generale) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @promo_generale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /promo_generales/1
  # DELETE /promo_generales/1.xml
  def destroy
    @promo_generale = PromoGenerale.find(params[:id])
    @promo_generale.destroy

    respond_to do |format|
      format.html { redirect_to(promo_generales_url) }
      format.xml  { head :ok }
    end
  end
end
