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
    @pa.created_at = Date.civil(params[:created_at][:year].to_i, params[:created_at][:month].to_i, params[:created_at][:day].to_i)
    # binding.pry
    # @list_ids = params[:project_assignment][:list_id]
    # @list_ids.shift
    @pa.list_id = ProjectAssignment.find(params[:list_id])
    if @list_ids.length > 1
      flash[:alert] = "Too many Lists selected."
      redirect_to new_user_project_assignment_path(current_user.id)
    else
      @pa.list_id = params[:project_assignment][:list_id][0].to_i
      @pa.save
      redirect_to user_project_assignment_path(current_user.id, @pa.id)
    end
  end

  def index
    @pa = ProjectAssignment.all
  end

  def destroy
    @pa = ProjectAssignment.find_by(params[:id]).destroy
    redirect_to user_path(current_user)
  end

  def show
    if @pa == nil || !@pa.valid?
      redirect_to user_path
    else
      @pa = ProjectAssignment.find(params[:id])
      @pa.list_id = List.find_by(id: params[:id])
    end
    # @pa.list = ProjectAssignment.find_by(list_id: params[:list_id])
    #this shows the correct location from the new form, but the list id/title is missing/incorrect
    # @pa.list = ProjectAssignment.find_by(params[:list])
  end


  private

  def pa_params
    params.require(:project_assignment).permit(:user_id, :list_id, :location, :created_at)
  end


end
