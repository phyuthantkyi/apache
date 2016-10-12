module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
    before_filter :configure_permitted_parameters, if: :devise_controller?
  end

  public

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation] )
    devise_parameter_sanitizer.permit(:account_update)
  end

end

DeviseController.send :include, DevisePermittedParameters
