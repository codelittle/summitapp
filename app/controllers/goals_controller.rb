class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
    @goals = Goal.all

  end

  def show
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def new
    @goal = Goal.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @frequency_array = @goal.frequency
  end

  def create
    @goal = Goal.new(goal_params)

    @goal.frequency = params[:goal][:frequency].join(',')

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: "Success." }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update

    @goal.frequency = params[:goal][:frequency].join(',')

    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to goal_path, :flash => { :success => "Great success!" } }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to admin_path, :flash => { :danger => "deleted!" } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:id, :title, :kind, :frequency, :minimum)
    end

end
