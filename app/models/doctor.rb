class Doctor < ApplicationRecord
  # Relationships will be added here when we add more tables
  # Validations will be added here
  validates :name, presence: true
  validates :description, presence: true
  has_one_attached :photo
  has_many :appointment, dependent: :destroy
  # def acceptable_image
  #   return unless main_image.attached?

  #   unless main_image.blob.byte_size <= 1.megabyte
  #     errors.add(:main_image, "is too big")
  #   end

  #   acceptable_types = ["image/jpeg", "image/png"]
  #   unless acceptable_types.include?(main_image.content_type)
  #     errors.add(:main_image, "must be a JPEG or PNG")
  #   end
  # end
end
