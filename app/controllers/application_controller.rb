class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # authorize_resource #cancancan
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end  
  
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  $USERS = User.count if $USERS.nil?
  $GAMES = Game.count if $GAMES.nil?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)  << :name
    devise_parameter_sanitizer.for(:sign_up)  << :surname
    devise_parameter_sanitizer.for(:account_update)  << :name
    devise_parameter_sanitizer.for(:account_update)  << :surname
  end 
end
