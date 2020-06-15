class ProducersController < ApplicationController

  def index
    @producer = Producer.all
  end

  def show
    @producer = Producer.find(params[:id])
    @favorited = FavoriteProducer.find_by(user_id: current_user.id, producer_id: @producer.id).present?
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
    @producer = Producer.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @producer
      flash[:success] = "Vous avez ajouté #{@producer.first_name} #{@producer.last_name} à votre liste de producteurs favoris."
      redirect_to producers_path(@producer)
      

    elsif type == "unfavorite"
      current_user.favorites.delete(@producer)
      flash[:notice] = "Vous avez supprimé #{@producer.first_name} #{@producer.last_name} de votre liste de producteurs favoris"
      redirect_to producers_path(@producer)

    else
      # Type missing, nothing happens
      flash[:notice] = 'Nothing happened.'
      redirect_to root_url
      
    end
  end


  private

  def producer_params
    params.require(:producer).permit(:email, :password)
  end

end
