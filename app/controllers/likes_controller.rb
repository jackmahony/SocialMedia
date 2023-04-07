class LikesController < ApplicationController  
  def create
    @like = current_user.likes.new(like_params)
    @like.liked = true
    if !@like.save
      flash[notice:] = @like.errors.full_messages.to_sentence
    end
    redirect_to root_path
  end

  def destroy  
    @like = current_user.likes.find_by(likeable_id: params[:likeable_id])
    
    if @like
      likeable = @like.likeable
      @like.destroy
      redirect_to root_path, notice: 'Like removed.'
    else
      redirect_to root_path, alert: 'Like not found.'
    end
  end

  private
    def like_params
      params.require(:like).permit(:likeable_id, :likeable_type)
    end

  
    
end

