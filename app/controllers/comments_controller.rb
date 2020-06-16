class CommentsController < ApplicationController

  def create
    @producer = Producer.find(params[:producer_id])
    @comment = Comment.new(user: current_user, producer: @producer, content: params[:content][0])
    if @comment.save
      flash[:success] = "Le commentaire a été posté !"
      redirect_back(fallback_location: @producer)
    else
      flash.now[:error] = @comment.errors.full_messages.to_sentence
      render 'show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "Le commentaire a été supprimé."
    redirect_back(fallback_location: @producer)
  end

end
