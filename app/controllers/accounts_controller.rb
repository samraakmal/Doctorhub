class AccountsController < ApplicationController
	def index
		@users = User.all
		 
		@user = User.new
		@appoitnments = Appointment.all
  
	end
	def users
		@users = User.all
	end

	def user_create
		@user = User.new(user_params)
		if @user.save!
		 redirect_to accounts_path, notice: "User created successfully"
		else
		redirect_to accounts_path, notice: "errors"
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end