class RepliesController < ApplicationController
  def index
    @replies=Reply.all
  end

  def show
  end

  def new
    
    @reply=Reply.new

  end

  def edit
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
    @reply = @comment.replies.create(reply_params)
    redirect_to post_comment_path(@comment)
  end

  def update
  end

  def destroy
  end

  private
    def reply_params
      params.require(:reply).permit(:reply)
    end
  
end
