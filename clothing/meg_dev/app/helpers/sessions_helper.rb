module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    if user.instance_of? Admin
        session[:admin_id] = user.id
    end
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:admin_id]
      @current_user ||= Admin.find_by(id: session[:admin_id])
    end
  end

  # Returns true if the seller is logged in, false otherwise.
  def admin_logged_in?
    if current_user.instance_of? Admin
        !current_user.nil?
    else
        return false
    end
  end

  def require_admin
    if !admin_logged_in?
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
    if current_user.instance_of? Admin
        session.delete(:admin_id)
        @current_user = nil
    end
  end
end
