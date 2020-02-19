class ProjectAssignmentsController < ApplicationController

  def new
    @pa = ProjectAssignment.new
    @lists = List.all
    @pa.user_id = current_user.id
  end

  def create

    @pa = ProjectAssignment.create(pa_params)
    @pa.user_id = current_user.id
    @pa.created_at = Date.civil

    params[:project_assignment][:list_id].shift
    @pa.list_id = params[:project_assignment][:list_id][0].to_i #how to make subsequent lists convert to_i ?
    @pa.save

    redirect_to user_project_assignment_path(current_user.id, @pa.id)
  end

  def index
    @pa = ProjectAssignment.all
  end

  def show

    @pa = ProjectAssignment.find_by(params[:id])
     binding.pry

  end


  private

  def pa_params
    params.require(:project_assignment).permit(:user_id, :list_id, :location, :created_at)
  end


end
