class AvatarUsersController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    avatar = params[:avatar_user]
    if avatar === nil
      flash[:error] = 'Vous ne pouvez pas uploader une image qui n\'existe pas'
      redirect_to(user_path(@user))
    else @user.avatar_user.attach(params[:avatar_user])
      redirect_to(user_path(@user))
    end
  end
end
