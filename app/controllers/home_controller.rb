class HomeController < ApplicationController
  def index
  	@types=current_user.user_type
  	if current_user.admin?
		redirect_to accounts_path
	elsif @types='user'
		redirect_to appointments_path
	elsif @types='patient'
		redirect_to appointments_path
	elsif @types='doctor'
		redirect_to appointments_path
    end
  end
end
