class LikesController < ApplicationController
    before_action :set_post
    def create
        current_user.like!(@post)
    end 
    
    def destroy
        # @post = current_user.posts.find_by(id: params[:post_id])
        current_user.likes.where(post_id: @post.id).delete_all
    end    

    private

    def set_post
        @post = Post.find(params[:post_id])
    end
    
    def set_like
      
    end  

end    