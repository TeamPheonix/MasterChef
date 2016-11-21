class Tag < ApplicationRecord
	validates :tag_name, presence: true, :uniqueness => {:case_sensitive => false}
	validates :approved, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
	has_many :tag_recipes
	has_many :recipes, :through => :tags_recipes
end
