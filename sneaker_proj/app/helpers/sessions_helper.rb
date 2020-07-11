module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    if user.instance_of? Buyer
        session[:buyer_id] = user.id
    elsif user.instance_of? Seller
        session[:seller_id] = user.id
    end
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:buyer_id]
      @current_user ||= Buyer.find_by(id: session[:buyer_id])
    elsif session[:seller_id]
      @current_user ||= Seller.find_by(id: session[:seller_id])
    end
  end
  # Returns true if the buyer is logged in, false otherwise.
  def buyer_logged_in?
    if current_user.instance_of? Buyer
        !current_user.nil?
    else
        return false
    end
  end
  # Returns true if the seller is logged in, false otherwise.
  def seller_logged_in?
    if current_user.instance_of? Seller
        !current_user.nil?
    else
        return false
    end
  end

  def require_seller
    if !seller_logged_in?
      flash[:danger] = "You need be a seller to do this"
      redirect_to root_path
    end
  end
  def require_buyer
    if !buyer_logged_in?
      flash[:danger] = "You need be a buyer to do this"
      redirect_to root_path
    end
  end
  def require_admin
    if !current_user.admin?
      flash[:danger] = "You need be an admin to do this"
      redirect_to root_path
    end
  end
  def require_user
    if !current_user.nil?
      flash[:danger] = "You are already logged in!"
      redirect_to root_path
    end
  end

  def log_out
    if current_user.instance_of? Buyer
        session.delete(:buyer_id)
        @current_user = nil
    elsif current_user.instance_of? Seller
        session.delete(:seller_id)
        @current_user = nil
    elsif current_user.instance_of? Admin
        session.delete(:admin_id)
        @current_user = nil
    end
  end

end
