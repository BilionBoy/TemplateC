class ApplicationController < ActionController::Base
  before_action :authenticate_user!  # Autentica o usuário antes de qualquer ação
  include Pagy::Backend  # Inclui Pagy para uso no Backend
  allow_browser versions: :modern

  # Definir o layout de acordo com o controller
  before_action :set_layout_by_controller

  private

  def set_layout_by_controller
    if devise_controller?
      self.class.layout "devise_application"
    else
      self.class.layout "home_application"
    end
  end
end
