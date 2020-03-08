class ProjectAssignmentsController < ApplicationController

  def new
    if logged_in?
      @pa = ProjectAssignment.new
      @lists = List.all
      @pa.user_id = current_user.id
    else
      redirect_to '/login'
    end
  end

  def create
    @pa = ProjectAssignment.create(pa_params)
    @pa.user_id = current_user.id
    @pa.location = params[:project_assignment][:location]
    @pa.list_id = params[:project_assignment][:list_id].shift
    @pa.list_id = params[:project_assignment][:list_id][0].to_i
    @pa.created_at = Date.civil(params[:created_at][:year].to_i, params[:created_at][:month].to_i, params[:created_at][:day].to_i)
      @pa.save
      redirect_to user_project_assignment_path(current_user.id, @pa.id)
  end

  def index
      @pa = ProjectAssignment.all
  end

  def destroy
    @pa = ProjectAssignment.find_by(params[:id]).destroy
    redirect_to user_path(current_user)
  end

  def show
    if logged_in?
      @pa = ProjectAssignment.find_by(id: params[:id])
    else  @pa == nil || !@pa.valid?
      redirect_to '/login'
    end
  end


  private

  def pa_params
    params.require(:project_assignment).permit(:user_id, :list_id, :location, :created_at)
  end

end
