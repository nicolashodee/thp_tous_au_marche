class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_current_user_showing?, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
      flash[:notice] = 'Vous avez supprimé votre compte utilisateur. A bientôt !'
      redirect_to root_url
    else 
      flash[:notice] = 'Une erreur est survenue, nous vous invitons à nous contacter directement.'
      redirect_to root_url
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'Vos informations ont été mises à jour !'
      redirect_to root_url
    elsif @user.update(user_params_profile)
      flash[:notice] = 'Vos informations ont été mises à jour !'
      redirect_to root_url
    else
      render :edit
    end
  end

  private
  def is_current_user_showing?
    unless current_user.id.to_s == params[:id].to_s
      flash[:danger] = "Vous ne pouvez pas afficher un profil utilisateur qui n'est pas le votre !"
      redirect_to user_path(current_user.id)
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def user_params_profile
    params.require(:user).permit(:first_name, :last_name, :phone_number)
  end

end
