class Api::V1::DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show update destroy]

  # GET /doctors
  def index
    @doctors = Doctor.all.joins(:photo_attachment)

    render json: @doctors.map { |doctor| doctor.as_json.merge({ photo_url: url_for(doctor.photo) }) }
  end

  # GET /doctors/1
  def show
    render json: @doctor.as_json.merge({ photo_url: url_for(@doctor.photo) })
  end

  # POST /doctors
  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: @doctor, status: :created, location: root_path
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doctors/1
  def update
    if @doctor.update(doctor_params)
      render json: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctors/1
  def destroy
    @doctor.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def doctor_params
    params.require(:doctor).permit(:name, :photo, :description)
  end
end
