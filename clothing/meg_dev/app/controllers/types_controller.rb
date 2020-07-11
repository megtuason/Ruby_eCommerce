class TypesController < ApplicationController
	before_action :require_admin
	def index
		@types = Type.all
		@products = Product.all
	end

	def show
		@type = Type.find(params[:id])
		@products = Product.all
	end

	def new
		@type = Type.new
		@product = Product.find(params[:format])
		@products = Product.all
	end

	def edit
		@type = Type.find(params[:id])
		@product = Product.find_by(params[:id])
		@products = Product.all
	end

	def update
		@type = Type.find(params[:id])
		@product = Product.find_by(params[:id])
		@products = Product.all
		if @type.update(type_params)
			flash[:notice] = "Update type was successful"
			redirect_to type_path(@type)
		else
			render 'edit'
		end
	end

	def destroy
		@type = Type.find(params[:id])
		@type.destroy
		flash[:notice] = "type destroyed"
		redirect_to types_path
	end
 
	def create
		@product = Product.find_by(params[:id])
		@products = Product.all
		@type = Type.new(type_params)
		@type.image.attach(params[:type][:image])
		if @type.save
			flash[notice] = "Created new type"
			redirect_to types_path
		else
			render 'new'
		end

	end

	private
		def type_params
			params.require(:type).permit(:product_id, :type_id, :type_color, :type_size, :image, :type_quantity)
			#image
		end
		def product_params
	      params.require(:product).permit(:product_name, :product_category, :product_price, :total_quantity)
	    end
end