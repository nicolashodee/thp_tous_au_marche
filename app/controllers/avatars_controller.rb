class AvatarsController < ApplicationController
  def create
    @producer = Producer.find(params[:producer_id])
    avatar = params[:avatar]
    if avatar === nil
      flash[:error] = 'Vous ne pouvez pas uploader une image qui n\'existe pas'
      redirect_to(producer_path(@producer))
    else @producer.avatar.attach(params[:avatar])
      redirect_to(producer_path(@producer))
    end
  end
end
