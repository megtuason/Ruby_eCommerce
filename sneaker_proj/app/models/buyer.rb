class Buyer < ApplicationRecord
	has_many :sales
	before_save {self.email = email.downcase}
	validates :first_name,
		presence: true

	validates :last_name,
		presence: true

	validates :birthday,
		presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,
	presence: true,
	length: {maximum: 100},
	uniqueness: { case_sensitivity: false},
	format: {with: VALID_EMAIL_REGEX}
	has_secure_password
end
