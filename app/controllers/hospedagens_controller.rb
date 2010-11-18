class HospedagensController < ApplicationController
  # GET /hospedagens
  # GET /hospedagens.xml
  def index
    @hospedagens = Hospedagem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hospedagens }
    end
  end

  # GET /hospedagens/1
  # GET /hospedagens/1.xml
  def show
    @hospedagem = Hospedagem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hospedagem }
    end
  end

  # GET /hospedagens/new
  # GET /hospedagens/new.xml
  def new
    @hospedagem = Hospedagem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hospedagem }
    end
  end

  # GET /hospedagens/1/edit
  def edit
    @hospedagem = Hospedagem.find(params[:id])
  end

  # POST /hospedagens
  # POST /hospedagens.xml
  def create
    @hospedagem = Hospedagem.new(params[:hospedagem])

    respond_to do |format|
      if @hospedagem.save
        format.html { redirect_to(@hospedagem, :notice => 'Hospedagem was successfully created.') }
        format.xml  { render :xml => @hospedagem, :status => :created, :location => @hospedagem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hospedagem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hospedagens/1
  # PUT /hospedagens/1.xml
  def update
    @hospedagem = Hospedagem.find(params[:id])

    respond_to do |format|
      if @hospedagem.update_attributes(params[:hospedagem])
        format.html { redirect_to(@hospedagem, :notice => 'Hospedagem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hospedagem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hospedagens/1
  # DELETE /hospedagens/1.xml
  def destroy
    @hospedagem = Hospedagem.find(params[:id])
    @hospedagem.destroy

    respond_to do |format|
      format.html { redirect_to(hospedagens_url) }
      format.xml  { head :ok }
    end
  end

  def consumo
    @hospedagem = Hospedagem.find(params[:id])
  end

  def consumir
    @hospedagem = Hospedagem.find(params[:id])
    @hospedagem.adicionar_consumo(params[:consumo])
    redirect_to @hospedagem
  end
end
