class Tag < ApplicationRecord
	validates :tag_name, presence: true, uniqueness: true
	validates :approved, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
end
