# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :autenticar_usuario

  def autenticar_usuario
    if usuario_autenticado
      true
    else
      false
    end
  end

  def usuario_autenticado
    if session[:usuario].present?
      Usuario.find(session[:usuario])
    else
      redirect_to new_sessao_path
    end
  end

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :senha
end
