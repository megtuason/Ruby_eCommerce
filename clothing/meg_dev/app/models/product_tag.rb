class ProductTag < ApplicationRecord
	self.primary_keys = :product_id, :tag_id
	has_many :products
	has_many :tags
	validates :product_id, presence: true, length: { in: 0..4 }, numericality: {only_integer: true}
	validates :tag_id, presence: true, length: { in: 0..4 }, numericality: {only_integer: true}
	def self.search(search)
		if search
			tag = Tag.find_by(tag_name: search)
			if tag
				self.where(tag_id: tag)
			else
				ProductTag.all
			end
		else
			ProductTag.all
		end
	end
end