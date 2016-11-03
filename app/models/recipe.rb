class Recipe < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id
  validates_presence_of :recipe_name
  validates_presence_of :instructions
  validates :complexity, :numericality => { :greater_than => 0 }
end
