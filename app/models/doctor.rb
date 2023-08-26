class Doctor < ApplicationRecord
  # Relationships will be added here when we add more tables
  # Validations will be added here
  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true

  has_many :appointments
  
end
