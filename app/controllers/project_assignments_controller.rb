class ProjectAssignmentsController < ApplicationController

  def new
    @pa = ProjectAssignment.new
    @lists = List.all
    @pa.user_id = current_user.id
  end

  def create

    @pa = ProjectAssignment.create(pa_params)
    @pa.user_id = current_user.id
    @pa.location = params[:project_assignment][:location]
    @pa.created_at = Date.civil
    params[:project_assignment][:list_id].shift
    @pa.list_id = params[:project_assignment][:list_id][0].to_i
    # @pa.list = params[:project_assignment][:list] #how to make subsequent lists convert to_i ?
    @pa.save
    binding.pry

    redirect_to user_project_assignment_path(current_user.id, @pa.id)
  end

  def index
    @pa = ProjectAssignment.all
  end

  def show
    # binding.pry

    @pa = ProjectAssignment.find_by(params[:id])

    @pa.list.title = List.find_by(params[:title])
    # @pa.list = ProjectAssignment.find_by(params[:list])


  end


  private

  def pa_params
    params.require(:project_assignment).permit(:user_id, :list_id, :location, :created_at)
  end


end
