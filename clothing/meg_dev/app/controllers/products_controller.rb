class ProductsController < ApplicationController
  before_action :require_admin
  def index
    @products = Product.all
    @types = Type.all
  end

  def show
    @product = Product.find(params[:id])
    @types = Type.all
    @product_tags = ProductTag.all
    @tags = Tag.all
  end

  def new
    @product = Product.new
    @types = Type.all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      flash[:notice] = "Update Product was successful"
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product destroyed"
    redirect_to products_path
  end
 
  def create
    @product = Product.new(product_params)
    @product.product_name = @product.product_name.capitalize
    if @product.save
      flash[notice] = "Created new Product"
      redirect_to product_path(@product)
    else
      render 'new'
    end

  end

  private
    def product_params
      params.require(:product).permit(:product_name, :product_category, :product_price, :total_quantity)
    end
end