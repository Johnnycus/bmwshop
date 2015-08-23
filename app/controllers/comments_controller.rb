class CommentsController < ApplicationController
  def index
    @comments = Comment.order('created_at DESC').limit(10)
    @comment = Comment.new
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:success] = "Feedback was successfully created"
      redirect_to contact_path
    else
      redirect_to contact_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
