class HomeController < ApplicationController
  skip_before_filter :autenticar_usuario

  def index
  end
end
