class RecipeImage < ApplicationRecord
  # upload images
  mount_uploader :image, ImageUploader
  # validations
  validates_presence_of :image
  # associations
  belongs_to :recipe
end
