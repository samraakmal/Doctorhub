class HomeController < ApplicationController
  def index
  	@types=current_user.user_type
  	if current_user.admin?
		redirect_to accounts_path
	elsif @types == 'simple_user'
		redirect_to appointments_simple_users_appointments_path
	elsif @types == 'patient'
		redirect_to appointments_patients_appointments_path
	elsif @types == 'doctor'
		redirect_to appointments_doctors_appointments_path
    end
  end
end
