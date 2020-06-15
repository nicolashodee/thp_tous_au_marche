class ProducersController < ApplicationController
  before_action :deny_to_visitors, only: [:show, :edit]

  def index
    @producer = Producer.all
  end

  def show
    @producer = Producer.find(params[:id])
  end

  def edit
    @producer = Producer.find(params[:id])
  end

  def destroy
    @producer = Producer.find(params[:id])
    @producer.destroy
    if @producer.destroy
      flash[:notice] = 'Vous avez supprimé votre compte producteur. À bientôt !'
      redirect_to root_url
    else 
      flash[:notice] = 'Une erreur est survenue, nous vous invitons à nous contacter directement.'
      redirect_to root_url
    end
    
  end

  def update
    @producer = Producer.find(params[:id])
    if @producer.update(producer_params)
      flash[:notice] = 'Vos informations ont été mises à jour !'
      redirect_to root_url
    else
      render :edit
    end
  end


  private

  def producer_params
    params.require(:producer).permit(:email, :password, :first_name, :last_name, :description, :address, :phone_number, :website)
  end

  def deny_to_visitors
    if  user_signed_in? || producer_signed_in?
    else
      flash[:danger] = 'Vous devez vous connecter !'
      redirect_to root_path
    end
  end

end