class Tag < ApplicationRecord
	validates :tag_name, presence: true, :uniqueness => {:case_sensitive => false}
	validates :approved, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
	has_many :tag_recipes, :dependent => :delete_all
	has_many :recipes, -> {uniq}, :through => :tags_recipes
end
