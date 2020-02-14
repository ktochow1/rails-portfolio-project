class ProjectAssignmentsController < ApplicationController
  def new
    @pa = ProjectAssignment.new
  end

  def create
    @pa = ProjectAssignment.create(pa_params)
  end

  private

  def pa_params
    params.require(:project_assignment).permit(:user_id, :list_id, :location, :created_at)
  end


end
