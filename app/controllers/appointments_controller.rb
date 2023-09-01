class AppointmentsController < ApplicationController
    before_action :set_appointment, only: %i[show update destroy]
    
    def index
      @appointments = Appointment.all
      render json: @appointments
    end
  
    def show
      render json: @appointment
    end
  
    def create
      @appointment = Appointment.new(appointment_params)
      @appointment.user_id = current_user.id
      @appointment.doctor_id = Doctor.pluck(:id).sample
      if @appointment.save
        render json: { message: 'Appointment created successfully' }, status: :created
      else
        render json: { errors: @appointment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @appointment.destroy
        render json: { message: 'Appointment destroyed successfully' }
      else
        render json: { error: 'Failed to destroy appointment' }, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_appointment
      @appointment = Appointment.find_by(id: params[:id])
  
      return if @appointment
  
      render json: { error: 'Appointment not found' }, status: :not_found
    end
  
    def appointment_params
      params.require(:appointment).permit(:date, :city)
    end
end

