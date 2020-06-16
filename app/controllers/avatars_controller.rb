class AvatarsController < ApplicationController
  def create
    @producer = Producer.find(params[:producer_id])
    @producer.avatar.attach(params[:avatar])
    redirect_to(producer_path(@producer))
  end
end
