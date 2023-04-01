class LikesController < ApplicationController
    before_action :set_post
    # before_action :set_like, only: [:destroy]

  def create
      @like = @post.likes.build(liked: true, user: current_user)
      if @like.save
      else
        redirect_to root_path
      end
  end 
  
  def destroy
    @like = Like.find_by(likeable_type: params[:likeable_type], likeable_id: params[:likeable_id], user_id: current_user.id)
  
    if @like
      @like.destroy
      # You can add a success response here, such as redirect or flash message
      redirect_to root_path, notice: 'Like removed.'
    else
      # You can add an error response here, such as redirect or flash message
      redirect_to root_path, alert: 'Like not found.'
    end
  end 

  private
    def set_post
      @post = Post.find(params[:post_id])
    end
end