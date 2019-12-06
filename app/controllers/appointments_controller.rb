class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy, :status,:doctor_id]

  # GET /appointments
  # GET /appointments.json

  # def redirect_after_sign_in
  # if current_user.admin?
  #   redirect_to '/accounts_path'
  # else
  #   redirect_to '/appointments_path'
  # end
# end
  
  def index
    @appointments=current_user.appointments
  end
  
  def simple_users
    @appointments=current_user.appointments
  end 

  def patients
    @appointments=current_user.appointments
  end  

  def doctors
    @appointments = Appointment.where(doctor_id: current_user.id).approved
  end
  
  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new

    @appointment = Appointment.new
    @users=User.doctor
   
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def status
    @appointment.update(status: params[:status])
    respond_to do |format| 
      if current_user.admin
        format.html { redirect_to accounts_path, notice: 'Appointment was successfully updated.' }
      else
        format.html { redirect_to appointments_path, notice: 'Appointment was successfully updated.' }
      end
    end
    
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        if current_user.admin
        format.html { redirect_to accounts_path, notice: 'Appointment was successfully updated.' }
      else
        format.html { redirect_to appointments_path, notice: 'Appointment was successfully updated.' }
      end
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:created_by, :description,:user_id,:doctor_id, :status)
    end
end
