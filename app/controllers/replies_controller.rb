class RepliesController < ApplicationController
  def index
    @replies=Reply.all
  end


  def new
    
    @reply=Reply.new

  end

  def edit
    @post=Post.find(params[:post_id])
    @comment=Comment.find(params[:comment_id])
    @reply=Reply.find(params[:id])
  end

  def create
    @post=Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
    @reply = @comment.replies.create(reply_params)
    redirect_to post_path(@comment.post, @comment)
  end

  def update
    @reply=Reply.find(params[:id])
    if @reply.update(reply_params)
      redirect_to post_path(@reply.comment.post)
    else
      render 'edit'
    end
  end

  def destroy
    @reply=Reply.find(params[:id])
     @reply.destroy
      redirect_to post_path(@reply.comment.post)
  end

  private
    def reply_params
      params.require(:reply).permit(:reply)
    end
  
end
