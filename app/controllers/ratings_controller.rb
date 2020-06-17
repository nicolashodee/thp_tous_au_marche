class RatingsController < ApplicationController
  before_action :unique_rating

  def create
    @producer = Producer.find(params[:producer_id])
    @rating = Rating.new(user: current_user, producer: @producer, rating: params[:rating])
    if @rating.save
      ratings = []
      Rating.where(producer: @producer).each{ |rating| ratings << rating }
      ratings_sum = 0
      ratings.each{ |rating| ratings_sum += rating.rating }
      @producer.update_attribute(:rating, ratings_sum / ratings.length)
      flash[:success] = "La note a été comptabilisée !"
      redirect_back(fallback_location: @producer)
    else
      flash.now[:error] = @rating.errors.full_messages.to_sentence
      render 'producers/show'
    end
  end

  private

  def unique_rating
    @producer = Producer.find(params[:producer_id])
    if Rating.where(user: current_user, producer: @producer)[0]
      rating = Rating.where(user: current_user, producer: @producer)[0]
      rating.destroy
    end
  end

end
