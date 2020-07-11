class SessionsController < ApplicationController
  before_action :require_user, only: [:new]
  def new
  end

  def create
    user = Seller.find_by(email: params[:session][:email].downcase)
    if user == nil
        user = Buyer.find_by(email: params[:session][:email].downcase)
    end


    if user && user.authenticate(params[:session][:password])
      # Log the user in as a Seller or Buyer
      log_in user
      redirect_to root_url
    else
      flash[:danger] = 'Invalid email/password combination!'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
