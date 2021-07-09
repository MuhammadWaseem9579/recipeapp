class Chef < ApplicationRecord
	validates :name , presence: true , length: {maxmimum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email , presence: true , length: {maxmimum: 50},
	format:{with: VALID_EMAIL_REGEX}
end