class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy, :vote]
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
  end

  def create
    @goal = Goal.new(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to goals_path, notice: "Success." }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update

    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to goal_path, :flash => { :success => "Great success!" } }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    if is_admin?
      @goal.destroy

      respond_to do |format|
        format.html { redirect_to admin_path, :flash => { :danger => "deleted!" } }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:id, :kind, :frequency, :minimum)
    end

end
