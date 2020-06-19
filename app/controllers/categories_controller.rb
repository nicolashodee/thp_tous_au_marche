class CategoriesController < ApplicationController

  def index
    @producer = Producer.find(params[:producer_id])
  end

  def create

  end

end
