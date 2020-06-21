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
      flash[:error] = 'Une erreur est survenue, nous vous invitons à nous contacter directement.'
      redirect_to root_url
    end
  end

  def update
    @user = User.find(params[:id])
    avatar_user = params.dig(:user, :avatar_user)
    first_name = params.dig(:user, :first_name)
    last_name = params.dig(:user, :last_name)
    if avatar_user.nil? && first_name.nil?
      flash[:error] = 'Vous ne pouvez pas télécharger une image vide'
      redirect_to user_path(current_user.id)

    elsif @user.update(user_params)
      flash[:notice] = 'Vos informations ont été mises à jour !'
      redirect_to user_path(current_user.id)

    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def is_current_user_showing?
    unless current_user.id.to_s == params[:id].to_s
      flash[:error] = "Vous ne pouvez pas afficher un profil utilisateur qui n'est pas le vôtre !"
      redirect_to user_path(current_user.id)
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :phone_number, :avatar_user)
  end

end
