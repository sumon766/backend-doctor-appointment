class Appointment < ApplicationRecord
  validates :date, :city, presence: true
  belongs :user
  belongs :doctor
end
