class ApplicationController < ActionController::Base
  # Допускаем только современные браузеры, поддерживающие WebP и другие новые технологии
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Разрешаем дополнительные параметры для Devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
