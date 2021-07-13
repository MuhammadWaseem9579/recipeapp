class Ingridiant < ApplicationRecord
	validates :name, presence: true, uniqueness: true, length: {minimum: 3,maximum: 25} 
	has_many :recipe_ingridiants
	has_many :recipes, through: :recipe_ingridiants
end