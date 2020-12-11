class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.problem_id = params[:problem_id]
    @comment.user = current_user

    if @comment.save
      redirect_to problems_path, notice: 'Comment was successfully created.'
    else
      redirect_to problems_path, alert: @comment.errors.full_messages.join('. ').to_s
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
