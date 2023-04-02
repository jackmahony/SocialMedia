class CommentsController < ApplicationController
    before_action :set_post
    def new
    end    

    def create
        comment = Comment.new(comment_params)
        comment.post = @post
        comment.user = current_user
        if comment.save
          # Return a Turbo Stream response that appends the comment to the correct post
          render turbo_stream: turbo_stream.append("comments_for_post_#{@post.id}", partial: "comments/comment", locals: { comment: comment })
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