class PostsController < ApplicationController
  def index
    @post = Post.all
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
