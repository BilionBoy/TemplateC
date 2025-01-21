module ApplicationHelper
  include Pagy::Frontend
  def pagy_nav_if_needed(pagy)
    pagy_bootstrap_nav(pagy) if pagy.pages > 1
  end
end
