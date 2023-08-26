class User < ApplicationRecord
  validates :username, :email, :role, presence: true
  has_many :appointments
end
