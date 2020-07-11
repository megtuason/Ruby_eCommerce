class OrdersController < ApplicationController
  before_action :require_admin
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      flash[:notice] = "Update Order was successful"
      redirect_to order_path(@order)
    else
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "Order destroyed"
    redirect_to orders_path
  end
 
  def create
    @order = Order.new(order_params)

    if @order.save
      flash[notice] = "Created new order"
      redirect_to order_path(@order)
    else
      render 'new'
    end

  end

  private
    def order_params
      params.require(:order).permit(:customer_name, :customer_address, :street, :city, :province, :zip, :contact_number, :email, :date_entered, :shipping_fee, :payment_method, :total_amount, :order_status)
    end
end