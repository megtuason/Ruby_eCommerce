class Product < ApplicationRecord
	has_many :types
	has_many :tags
	validates :product_name, presence: true, length: { maximum: 30 }, uniqueness: true
	validates :product_category, presence: true, acceptance: { accept: ['Top', 'Bottom', 'Dress', 'Accessory'] }
	validates :product_price, presence: true, length: { maximum: 8 }, numericality: { greater_than: 0 }
	validates :total_quantity, presence: true, length: { maximum: 3 }, numericality: { only_integer: true }
end
