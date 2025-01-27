class ApplicationController < ActionController::Base
  before_action :authenticate_user!  # Autentica o usuário antes de qualquer ação
  include Pagy::Backend  # Inclui Pagy para uso no Backend

  # Definir o layout de acordo com o controller
  before_action :set_layout_by_controller

  private

  def set_layout_by_controller
    if devise_controller?
      self.class.layout "devise_application"
    else
      self.class.layout "application"
    end
  end


  # Verifica se o usuário tem a função "Administrador"
  def authenticate_admin!
    puts "Função do usuário: #{current_user.funcao&.nome}"
    if current_user.funcao&.nome != "Administrador"
      flash[:alert] = "Você não tem permissão para acessar esta página."
      redirect_to root_path
    end
  end
end
