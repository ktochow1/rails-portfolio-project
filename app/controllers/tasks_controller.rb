class TasksController < ApplicationController


  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.list
  end


  # def create
  #   @user = User.new(user_params)
  #   @user.save
  #   session[:user_id] = @user.id
  #   redirect_to '/welcome'
  # end

  def update
  end

  def delete
  end

  def index
    @tasks = Task.all
  end

  private

  def task_params
    params.require(:task).permit(:task_status, :content)
  end
end
