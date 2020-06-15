class ProducersController < ApplicationController
  before_action :deny_to_visitors, only: [:show]

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
      flash[:notice] = 'Vous avez supprimé votre compte producteur. A bientôt !'
      redirect_to root_url
    else 
      flash[:notice] = 'Une erreur est survenue, nous vous invitons à nous contacter directement.'
      redirect_to root_url
    end
    
  end

  def update
    @producer = Producer.find(params[:id])
    if @producer.update(producer_params)
      flash[:notice] = 'Infos producteur mises a jour !'
      redirect_to root_url
    else
      render :edit
    end
  end


  private

  def producer_params
    params.require(:producer).permit(:email, :password)
  end

  def deny_to_visitors
    flash[:danger] = 'Vous devez vous connecter !'
    redirect_to root_path unless user_signed_in? or producer_signed_in?
  end

end