class Sale < ApplicationRecord
	belongs_to :seller
	belongs_to :buyer, optional: true
	belongs_to :product

	validates :price,
		presence: true
end
