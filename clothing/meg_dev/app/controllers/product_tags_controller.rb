class ProductTagsController < ApplicationController
  before_action :require_admin
  def index
    @product_tags = ProductTag.all
    @products = Product.all
    @tags = Tag.all
  end

  def show
    @product_tag = ProductTag.find(params[:id])
    @products = Product.all
    @tags = Tag.all
  end

  def new
    @product_tag = ProductTag.new
    @product = Product.find(params[:format])
    @products = Product.all
    @tags = Tag.all
  end

  def destroy
    @product_tag = ProductTag.find(params[:id])
    @product_tag.destroy
    flash[:notice] = "Product Tag destroyed"
    redirect_to product_tags_path
  end
 
  def create
    @tags = Tag.all
    @product_tag = ProductTag.new(product_tag_params)
    @product = Product.find_by(params[:id])
    @products = Product.all
    if @product_tag.save
        flash[notice] = "Created new Product Tag"
        redirect_to product_tag_path(@product_tag)
    else
        render 'new'
    end
  end

  private
    def product_tag_params
      params.require(:product_tag).permit(:product_id, :tag_id, :search)
    end
end