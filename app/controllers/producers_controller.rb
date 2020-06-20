class ProducersController < ApplicationController
  before_action :authenticate_producer!, only: [:edit]
  before_action :deny_to_visitors, only: [:show, :edit]

  def index
    @producer = Producer.all
    @icon_options = { :name => 'house',
                     :icon_url => 'images/house.png',
                     :shadow_url => 'images/house_shadow.png',
                     :icon_size => [38, 95],
                     :shadow_size => [50, 64],
                     :icon_anchor => [22, 94],
                     :shadow_anchor => [4, 62],
                     :popup_anchor => [-3, -76]}
  end

  def show
    @producer = Producer.find(params[:id])
    @favorited = FavoriteProducer.find_by(producer_id: @producer.id).present?
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
      flash[:error] = 'Une erreur est survenue, nous vous invitons à nous contacter directement.'
      redirect_to root_url
    end
  end

  def update
    @producer = Producer.find(params[:id])
    avatar = params.dig(:producer, :avatar)
    images = params.dig(:producer, :images)
    first_name = params.dig(:producer, :first_name)
    if avatar.nil? && images.nil? && first_name.nil?
      flash[:error] = 'Vous ne pouvez pas télécharger une image vide'
      redirect_to producer_path(current_producer.id)

    elsif @producer.update(producer_params)
      flash[:notice] = 'Vos informations ont été mises à jour !'
      redirect_to producer_path(current_producer.id)

    else
      flash.now[:error] = @producer.errors.full_messages.to_sentence
      render :edit
    end
  end

  # Add and remove favorite producers for current_user
  def favorite
    @producer = Producer.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @producer
      flash[:success] = "Vous avez ajouté #{@producer.first_name} #{@producer.last_name} à votre liste de producteurs favoris"
      redirect_to producer_path
      
    elsif type == "unfavorite"
      current_user.favorites.delete(@producer)
      flash[:notice] = "Vous avez supprimé #{@producer.first_name} #{@producer.last_name} de votre liste de producteurs favoris"
      redirect_to producer_path

    elsif type == "unfavorite-from-user-profile"
      current_user.favorites.delete(@producer)
      flash[:notice] = "Vous avez supprimé #{@producer.first_name} #{@producer.last_name} de votre liste de producteurs favoris"
      redirect_to user_path(current_user.id)

    else
      # Type missing, nothing happens
      flash[:error] = "Rien ne s\'est produit"
      redirect_to root_url
      
    end
  end

  # delete images products
  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    flash[:notice] = 'Vous avez supprimé une image de votre profil'
    redirect_to(producer_path(current_producer))
  end

  private

  def producer_params
    params.require(:producer).permit(
      :email,
      :password,
      :first_name,
      :last_name,
      :description,
      :address,
      :phone_number,
      :website,
      :city_name,
      :zip_code,
      :avatar,
      images: [])
  end

  def deny_to_visitors
    if  user_signed_in? || producer_signed_in?
    else
      flash[:error] = 'Vous devez vous connecter !'
      redirect_to root_path
    end
  end

end