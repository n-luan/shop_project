class Users::ProfilesController < ApplicationController
  before_action :check_login

  def show
    @profile  = Profile.find_by(user_id: current_user.id)
  end

  def edit
    @profile  = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(profile_params)
      flash[:success] = "Update profile success!"
      redirect_to users_profile_path
    else
      flash[:danger] = "Update faild"
      render :edit
    end
  end

  private

  def check_login
    unless user_signed_in?
      flash[:warning] = "You need login first"
      redirect_to new_user_session_url
    end
  end

  def profile_params
    params.require(:profile).permit(:avatar, :address, :phone, :facebook, :twitter, :instagram, user_attributes: [:id, :name])
  end

end
