class ReservasController < ApplicationController
  # GET /reservas
  # GET /reservas.xml
  def index
    @reservas = Reserva.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reservas }
    end
  end

  # GET /reservas/1
  # GET /reservas/1.xml
  def show
    @reserva = Reserva.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reserva }
    end
  end

  # GET /reservas/new
  # GET /reservas/new.xml
  def new
    @reserva = Reserva.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reserva }
    end
  end

  # GET /reservas/1/edit
  def edit
    @reserva = Reserva.find(params[:id])
  end

  # POST /reservas
  # POST /reservas.xml
  def create
    @reserva = Reserva.new(params[:reserva])

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to(@reserva, :notice => 'Reserva was successfully created.') }
        format.xml  { render :xml => @reserva, :status => :created, :location => @reserva }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reserva.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reservas/1
  # PUT /reservas/1.xml
  def update
    @reserva = Reserva.find(params[:id])

    respond_to do |format|
      if @reserva.update_attributes(params[:reserva])
        format.html { redirect_to(@reserva, :notice => 'Reserva was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reserva.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.xml
  def destroy
    @reserva = Reserva.find(params[:id])
    @reserva.destroy

    respond_to do |format|
      format.html { redirect_to(reservas_url) }
      format.xml  { head :ok }
    end
  end
end
