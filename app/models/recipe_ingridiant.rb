class RecipeIngridiant < ApplicationRecord
	belongs_to :recipe
	belongs_to :ingridiant
end