class SessionsHelper
  def log_in (admin)
    session[:admin_id] = admin.id
  end

  def current_admin
    if(admin_id = session[:admin_id])
      @current_admin ||= Admin.find_by(id: admin_id)
    elsif(admin_id = cookies.singed[:admin_id])
      admin = Admin.find_by(id:admin_id)
      if admin && admin.authenticated?(:remember, cookies[:remember])
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

  def logout
    forget(current_admin)
    session.delete(:admin_id)
    @current_admin = nil
  end

  def remember(admin)
    admin.remember
    cookies.permanent.signed[:admin_id] = admin.id
    cookies.permanent[:remember_token] = admin.remember_token
  end

end