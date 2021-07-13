class Recipe < ApplicationRecord
	validates :name , presence: true
	validates :description , presence: true, length: {minimum: 5, max: 500}

	belongs_to :chef
	has_many :recipe_ingridiants

	has_many :ingridiants, through: :recipe_ingridiants

end