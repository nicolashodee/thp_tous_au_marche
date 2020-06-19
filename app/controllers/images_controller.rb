class ImagesController < ApplicationController
  def create
    @producer = Producer.find(params[:producer_id])
    image = params[:images]
    if image === nil
      flash[:error] = 'Vous ne pouvez pas uploader une images qui n\'existe pas'
      redirect_to(producer_path(@producer))
    else @producer.images.attach(params[:images])
      redirect_to(producer_path(@producer))
    end
  end

end
