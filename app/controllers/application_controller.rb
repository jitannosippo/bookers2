class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: [:top, :about]

  before_action:configure_pernitted_parameters,if: :devise_controller?
    def after_sign_in_path_for(resource)
      user_path(resource.id)
    end



  protected

  def configure_pernitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end

end
