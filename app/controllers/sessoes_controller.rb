class SessoesController < ApplicationController
  skip_before_filter :autenticar_usuario

  def new
  end

  def create
    if usuario_id = Usuario.autenticar(params[:sessao])
      session[:usuario] = usuario_id
      redirect_to '/'
    else
      flash[:error] = 'Usuário e/ou Senha inválidos.'
      render :new
      flash[:error] = nil
    end
  end

  def destroy
    session[:usuario] = nil
    redirect_to '/'
  end
end
