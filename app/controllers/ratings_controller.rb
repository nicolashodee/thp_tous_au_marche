class RatingsController < ApplicationController

  def create
    @producer = params[:producer_id]
    @rating = Rating.new(user: current_user, producer: @producer, rating: params[:rating])
    if @rating.save
      ratings = []
      
      @producer.rating =
      flash[:success] = "La note a été comptabilisée !"
      redirect_back(fallback_location: @producer)
    else
      flash.now[:error] = @rating.errors.full_messages.to_sentence
      render 'show'
    end
  end



end
