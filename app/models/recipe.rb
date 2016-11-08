class Recipe < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id
  validates_presence_of :recipe_name
  validates_presence_of :instructions
  validates :complexity, :numericality => { :greater_than => 0, less_than_or_equal_to: 10 }
  has_many :tags_recipes
  has_many :tags, :through => :tags_recipes
end


