class CommentsController < ApplicationController
    before_action :set_post

    
    def new
    end    

    def create
        comment = Comment.new(comment_params)
        comment.post = @post
        comment.user = current_user
        if comment.save
        else
            render :new, status: :unprocessable_entity
        end
    end   

    private
        def set_post
            @post = Post.find(params[:post_id])
        end    
        
        def comment_params 
            params.require(:comment).permit(:body)
        end   

    end