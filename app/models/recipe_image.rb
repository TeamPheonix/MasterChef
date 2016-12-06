class RecipeImage < ApplicationRecord
  # upload images
  mount_uploader :image, ImageUploader
  # associations
  belongs_to :recipe
end
