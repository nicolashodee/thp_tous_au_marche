class CommentsController < ApplicationController
  before_action :check_name

  def create
    @producer = Producer.find(params[:producer_id])
    @comment = Comment.new(user: current_user, producer: @producer, content: params[:content][0])
    if @comment.save
      flash[:success] = "Le commentaire a été posté !"
      redirect_back(fallback_location: @producer)
    else
      render 'show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "Le commentaire a été supprimé."
    redirect_back(fallback_location: @producer)
  end

  private

  def check_name
    if !current_user.first_name || !current_user.first_name || current_user.first_name.length <= 1 || current_user.last_name.length <= 1
      flash[:error] = "Veuillez remplir votre prénom et nom avant de poster un commentaire."
      redirect_to proc { edit_user_url(current_user) }
    end
  end

end
