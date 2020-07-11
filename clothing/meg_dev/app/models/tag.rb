class Tag < ApplicationRecord
	has_many :products
	validates :tag_name, presence: true, length: { maximum: 20 }, uniqueness: true
end
