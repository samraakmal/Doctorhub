class User::InvitationsController < Devise::InvitationsController
  before_action :update_sanitized_params, only: [:create]
  # PUT /resource/invitation
  def create
    super
  end

  private
  
  def update_sanitized_params
    devise_parameter_sanitizer.permit(:invite, keys: [:user_type])
  end
end
