class TagsController < ApplicationController
	before_action :require_admin
	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def new
		@tag = Tag.new
	end

	def edit
		@tag = Tag.find(params[:id])
	end

	def update
		@tag = Tag.find(params[:id])

		if @tag.update(tag_params)
			flash[:notice] = "Update Tag was successful"
			redirect_to tag_path(@tag)
		else
			render 'edit'
		end
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.delete
		flash[:notice] = "Tag destroyed"
		redirect_to tags_path
	end
 
	def create
		@tag = Tag.new(tag_params)
		if @tag.save
			flash[notice] = "Created new tag"
			redirect_to tag_path(@tag)
		else
			render 'new'
		end

	end

	private
		def tag_params
			params.require(:tag).permit(:tag_name, :product_id)
		end
end