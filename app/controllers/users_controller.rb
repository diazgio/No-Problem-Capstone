class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    @new_problem = Problem.new
    @users = @user.followds
    @users2 = @user.follows

    respond_to do |format|
      if @user
        format.html
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
