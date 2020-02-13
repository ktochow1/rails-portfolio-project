class TasksController < ApplicationController


  def new
    @task = Task.new
  end

  def create
    if logged_in?
      @task = Task.new(task_params)
      @list.id = list_id
      current_user.id = user_id
    else
      redirect_to '/login'
    end
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
    if logged_in?
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
