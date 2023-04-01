class PostsController < ApplicationController
  def index
    @post = Post.all

  #   # First, find the "Like" record for the current user with "liked" set to false
  #   like = current_user.likes.find_by(liked: false)

  #   if current_user && like
  #     # Set an instance variable to be used in your view
  #     @post_actions_unlike = "post-actions-unlike"
  #   else
  #     # Set another instance variable for your view
  #     @post_actions_like = "like-button-liked"
  #   end
  end  

  def new
    @post= Post.new
  end

  def create
    
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.valid?
      @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end    
  end

  private
    def post_params
      params.require(:post).permit(:body)
    end  
    
    
    # def set_current_user
    #   Current.user = current_user
    # end
   
end
