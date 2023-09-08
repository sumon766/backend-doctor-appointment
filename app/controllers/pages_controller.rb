class PagesController < ApplicationController
  def index
    render json: { status: 200, message: 'Welcome to Doctors Appointment API' }
  end
end
