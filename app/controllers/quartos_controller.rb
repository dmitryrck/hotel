class QuartosController < ApplicationController
  # GET /quartos
  # GET /quartos.xml
  def index
    @quartos = Quarto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quartos }
    end
  end

  # GET /quartos/1
  # GET /quartos/1.xml
  def show
    @quarto = Quarto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quarto }
    end
  end

  # GET /quartos/new
  # GET /quartos/new.xml
  def new
    @quarto = Quarto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quarto }
    end
  end

  # GET /quartos/1/edit
  def edit
    @quarto = Quarto.find(params[:id])
  end

  # POST /quartos
  # POST /quartos.xml
  def create
    @quarto = Quarto.new(params[:quarto])

    respond_to do |format|
      if @quarto.save
        format.html { redirect_to(@quarto, :notice => 'Quarto was successfully created.') }
        format.xml  { render :xml => @quarto, :status => :created, :location => @quarto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quarto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quartos/1
  # PUT /quartos/1.xml
  def update
    @quarto = Quarto.find(params[:id])

    respond_to do |format|
      if @quarto.update_attributes(params[:quarto])
        format.html { redirect_to(@quarto, :notice => 'Quarto was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quarto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quartos/1
  # DELETE /quartos/1.xml
  def destroy
    @quarto = Quarto.find(params[:id])
    @quarto.destroy

    respond_to do |format|
      format.html { redirect_to(quartos_url) }
      format.xml  { head :ok }
    end
  end
end
