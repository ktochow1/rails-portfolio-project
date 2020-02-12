class TasksController < ApplicationController


  def new
    if authorized
      @task = Task.new
    else
      redirect '/login'
    end
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
    if authorized
      @tasks = Task.all
    else
      redirect_to '/login'
    end
  end

  private

  def task_params
    params.require(:task).permit(:task_status, :content)
  end
end
