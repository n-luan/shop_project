module Admins
class SessionsController < Admins::Base2Controller
  layout "admin/application", :except => [:new, :create]
  def new; end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      params[:session][:remember_me] = "1" ? remember(admin) : forget(admin)
      flash[:success] = "Welcome #{admin.email}"
      redirect_to admin_root_path
    else
      flash.now[:danger] = "Email or password not correct. Please try again"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to admin_root_url
  end
  end
end
