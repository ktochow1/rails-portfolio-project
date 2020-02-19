class ProjectAssignmentsController < ApplicationController
  def new
    @pa = ProjectAssignment.new
    @lists = List.all
  end

  def create

    @pa = ProjectAssignment.create(pa_params)
    @pa.user_id = params[:project_assignment][:user].to_i
    @pa.created_at = Date.civil
    @pa.list_id = params[:project_assignment][:list].to_i
    @pa.save
    # binding.prye
    # current_user.id = @user.id

    # binding.pry
    # @pa.user_id = params[:user_id]

    # @lists = List.all
    # @pa.list_id = List.find_by(params[:id])
    # binding.pry
    redirect_to(@pa.id)
    # binding.pry
  end

  def index
    @pa = ProjectAssignment.all
  end

  def show

    @pa = ProjectAssignment.find_by(params[:id])

  end


  private

  def pa_params
    params.require(:project_assignment).permit(:user_id, :list_id, :location, :created_at)
  end


end
