class TasksController < ApplicationController


  def new
    if logged_in?
      @task = Task.new
      list_id = List.find_by(params[:id])
    end
  end

  def create
      @task = Task.new(task_params)
      @task.list_id = List.find_by(params[:id]).id
      @task.save
      # binding.pry
      redirect_to list_task_path(@task.list_id, @task.id)

    else
      redirect_to '/login'
    end
  end


  def show
    if logged_in?
      @task = Task.find_by(id: params[:id])
      @task.list_id = List.find_by(id: params[:id])
    end
  end

  # def create
  #   @user = User.new(user_params)
  #   @user.save
  #   session[:user_id] = @user.id
  #   redirect_to '/welcome'
  # end
  def edit
    if logged_in?
      @task = Task.find(params[:id])
    else
      redirect_to '/login'
    end
  end


  def update
    @task = Task.find_by(params[:id])
    @task.update(task_params)
  end

  def destroy
    @task = Task.find_by(id: params[:id]).destroy
    redirect_to list_path(@task.list.id)
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
    params.require(:task).permit(:task_status, :content, :list_id)
  end
end
