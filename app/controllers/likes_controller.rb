class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(problem_id: params[:problem_id])

    if @like.save
      redirect_to problems_path, notice: 'You liked a post.'
    else
      redirect_to problems_path, alert: 'You cannot like this post.'
    end
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, problem_id: params[:problem_id])
    if like
      like.destroy
      redirect_to problems_path, notice: 'You disliked a problem.'
    else
      redirect_to problems_path, alert: 'You cannot dislike problem that you did not like before.'
    end
  end
end
