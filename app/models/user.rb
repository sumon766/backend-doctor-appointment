class User < ApplicationRecord
    validates :username, :email, :role, presence: true
  end
  