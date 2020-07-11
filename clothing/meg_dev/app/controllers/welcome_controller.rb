class WelcomeController < ApplicationController
	def home
		@header = true
	end
	def about
		@header = true
	end
	 def index
	 	@header = true
	    @products = Product.all
	    @tags = Tag.all
	    @types = Type.all
	    @product_tag = ProductTag.search(params[:search])
  	end
	def contact
		@header = true
	end
	def storefront
		@header = true
		@products = Product.all
		@types = Type.all
	end
	def tops
		@header = true
		@products = Product.all
		@types = Type.all
	end
	def bottoms
		@header = true
		@products = Product.all
		@types = Type.all
	end
	def dresses
		@header = true
		@products = Product.all
		@types = Type.all
	end
	def acc
		@header = true
		@products = Product.all
		@types = Type.all
	end
	def cart
		@header = true
	end
	def show
		@header = true
		@products = Product.all
		@type = Type.find(params[:format])
	end
	private
	def product_tag_params
      params.require(:product_tag).permit(:product_id, :tag_id, :search)
    end
end
