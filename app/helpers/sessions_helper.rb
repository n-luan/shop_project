module SessionsHelper

  def valid_order
    unless current_order.product_orders.presence
      flash[:info] = "Continuing shopping!"
      redirect_to root_path
    end
  end

  def log_in (admin)
    session[:admin_id] = admin.id
  end

  def current_admin
    if(admin_id = session[:admin_id])
      @current_admin ||= Admin.find_by(id: admin_id)
    elsif(admin_id = cookies.signed[:admin_id])
      admin = Admin.find_by(id:admin_id)
      if admin && admin.authenticated?(:remember, cookies[:remember_token])
        log_in admin
        @current_admin = admin
      end
    end
  end

  def current_admin? admin
    @current_admin == admin
  end

  def logged_in?
    !current_admin.nil?
  end

  def forget(admin)
    admin.forget
    cookies.delete(:admin_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_admin)
    session.delete(:admin_id)
    @current_admin = nil
  end

  def remember(admin)
    admin.remember
    cookies.permanent.signed[:admin_id] = admin.id
    cookies.permanent[:remember_token] = admin.remember_token
  end

  def logged_in_admin
    unless logged_in?
      flash[:danger] = "You need to login"
      redirect_to new_admin_session_path
    end
  end

end
