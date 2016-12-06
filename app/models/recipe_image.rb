class RecipeImage < ApplicationRecord
  # upload images
  mount_uploader :image, ImageUploader
  # associations
  belongs_to :recipe
  validates_presence_of :image
end
