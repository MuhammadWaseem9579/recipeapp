class Recipe < ApplicationRecord
	validates :name , presence: true
	validates :description , presence: true, length: {minimum: 5, max: 500}
end