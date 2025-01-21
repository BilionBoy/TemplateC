class ApplicationController < ActionController::Base
  include Pagy::Backend  # Inclui Pagy para uso no Backend
  allow_browser versions: :modern
end
