class Appointment < ApplicationRecord
    validates :date, :city, presence: true
  end
  