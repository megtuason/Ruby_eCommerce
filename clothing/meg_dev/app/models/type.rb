class Type < ApplicationRecord
	# self.primary_keys = :type_id, :product_id
	self.primary_keys = :type_id
	belongs_to :product
	has_one_attached :image
	validates :product_id, presence: true, length: { in: 0..4 }
	validates :type_color, presence: true, length: { maximum: 20 }
	validates :type_size, presence: true, acceptance: { accept: ['S', 'M', 'L', 'XL'] }
	validates :type_quantity, presence: true, length: { maximum: 3 }, numericality: { only_integer: true }
	before_create :set_total_quantity
	# before_update :update_total_quantity

	def find_by_typename(shet)
		if shet
			ngek = Product.find_by(product_id: shet)
			puts "HELLLOOOOOO"
			puts ngek
		end
	end


private
	def set_total_quantity
		@products = Product.all
		@products.each do |prod|
			if prod.product_id == self.product_id
				prod.total_quantity = prod.total_quantity + self.type_quantity
				prod.update_attribute(:total_quantity, prod.total_quantity)
			end
		end
	end
	def update_total_quantity
		@products = Product.all
		@types = Type.all
		@types.each do |type|
			if type.type_id == self.type_id
				puts type.type_quantity
				puts "HELLLOOOOOO"
				puts self.type_quantity
			end
		end
	end
end

