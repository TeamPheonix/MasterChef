class TagsRecipe < ApplicationRecord
	belongs_to :tag
	belongs_to :recipe
        validates_uniqueness_of :tag_id, :scope => :recipe_id
end
