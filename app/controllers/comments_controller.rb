class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[ show edit update destroy ]

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:success] = 'Comment created'
    else
      flash[:danger] = @comment.errors.full_messages
    end

    redirect_to movie_path(@comment.movie)
  end

  def destroy
    movie = @comment.movie
    @comment.destroy
    flash[:success] = "Commend was successfully destroyed"
    redirect_to movie_path(movie)
  end

  private

  def comment_params
    data = params.require(:comment).permit(:body, :movie_id)
    data[:user_id] = current_user.id

    data
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
