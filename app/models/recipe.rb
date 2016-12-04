class Recipe < ApplicationRecord
  #Impressionist
  is_impressionable :counter_cache => true, :unique => :request_hash
  #image uploading
  mount_uploader :image, ImageUploader
  # Associations
  belongs_to :user
  has_many :tags_recipes, :dependent => :delete_all
  has_many :tags, -> {uniq}, :through => :tags_recipes
  has_many :recipe_images
  # Validations
  validates_presence_of :user_id
  validates_presence_of :recipe_name
  validates_presence_of :instructions
  validates :complexity, :numericality => { :greater_than => 0, less_than_or_equal_to: 10 }
end


