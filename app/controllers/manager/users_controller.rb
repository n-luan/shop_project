class Manager::UsersController < Manager::BaseController

  def index
    @users = User.order("created_at desc")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.create_profile
      @users = User.order("created_at desc")
      flash.now[:success] = "Add user success"
    else
      render "new_invalid"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:function] == "unlock"
      @user.unlock_user
      @users = User.order("created_at desc")
      flash.now[:success] = "Unlock user success"
    elsif params[:function] == "lock"
      @user.lock_user
      @users = User.order("created_at desc")
      flash.now[:success] = "Lock user success"
    elsif params[:function] == "update" && @user.update_attributes(user_params)
      @users = User.order("created_at desc")
      flash.now[:success] = "Update user success"
    else
      render "update_invalid"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @users = User.order("created_at desc")
    flash.now[:success] = "Delete user success" if @user.destroy
  end

  private

  def user_params
    if params[:user][:password].blank?
     params.require(:user).permit(:name, :email)
   else
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
  end
end
