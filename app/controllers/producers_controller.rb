class ProducersController < ApplicationController
  before_action :authenticate_producer!, only: [:show]
  before_action :is_current_producer_showing?, only: [:show]

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
          flash[:notice] = 'Producteur supprime'
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
  def is_current_producer_showing?
    unless current_producer.id.to_s == params[:id].to_s
      flash[:danger] = "Vous ne pouvez pas afficher un profil producteur qui n'est pas le votre !"
      redirect_to producer_path(current_producer.id)
    end
  end

  def producer_params
    params.require(:producer).permit(:email, :password)
  end

end
