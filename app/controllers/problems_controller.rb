class ProblemsController < ApplicationController
  before_action :set_problem, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /problems
  # GET /problems.json
  def index
    @problems = Problem.all.order('created_at DESC')
    @problem = Problem.new
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
  end

  # GET /problems/new
  def new
    @problem = current_user.problems.build
  end

  # GET /problems/1/edit
  def edit
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = current_user.problems.build(problem_params)

    respond_to do |format|
      if @problem.save
        format.html { redirect_to root_path, notice: 'Problem was successfully created.' }
        format.json { render :show, status: :created, location: @problem }
      else
        format.html { render :new }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problems/1
  # PATCH/PUT /problems/1.json
  def update
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to root_path, notice: 'Problem was successfully updated.' }
        format.json { render :show, status: :ok, location: @problem }
      else
        format.html { render :edit }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to problems_url, notice: 'Problem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = Problem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def problem_params
      params.require(:problem).permit(:content, :user_id, :body, :category_id)
    end
end
