class Tag < ApplicationRecord
	validates :tag_name, presence: true, uniqueness: true
end
