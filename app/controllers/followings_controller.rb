class FollowingsController < ApplicationController
  before_action :set_user, only: %i[create destroy]
  before_action :authenticate_user!

  # POST /followings/user
  # POST /followings/user.json
  def create
    @following = Following.new
    if @following.build_saving(@user, current_user)
      flash[:notice] = "Success following #{@user.username}"
    else
      flash[:alert] = "Error to follow #{@user.username}"
    end
    redirect_to request.referer
  end

  # DELETE /followings/1
  # DELETE /followings/1.json
  def destroy
    current_user.unfollow(@user)
    flash[:notice] = "Unfollow #{@user.username}"
    redirect_to request.referer
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def following_params
    params.fetch(:following, {})
  end
end
