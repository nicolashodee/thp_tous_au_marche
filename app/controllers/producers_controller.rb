class ProducersController < ApplicationController

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

  # Add and remove favorite producers for current_user
  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @producer
      redirect_to :back, notice: 'You favorited #{@producer.email}'

    elsif type == "unfavorite"
      current_user.favorites.delete(@producer)
      redirect_to :back, notice: 'Unfavorited #{@producer.email}'

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end


  private

  def producer_params
    params.require(:producer).permit(:email, :password)
  end

end
