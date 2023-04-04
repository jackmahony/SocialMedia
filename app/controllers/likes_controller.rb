class LikesController < ApplicationController
  before_action :set_post
  
  def create
    @like = current_user.likes.new(like_params)
    @like.liked = true
    if !@like.save
      flash[notice:] = @like.errors.full_messages.to_sentence
    end
    redirect_to root_path
  end

  def destroy  
    @like = current_user.likes.find_by(id: params[:id])
    likeable = @like.likeable
    @like.destroy
    redirect_to root_path
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end
    
    def like_params
      params.require(:like).permit(:likeable_id, :likeable_type)
     end
end