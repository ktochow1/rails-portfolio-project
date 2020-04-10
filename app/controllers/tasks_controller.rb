class TasksController < ApplicationController


  def new
    @task = Task.new
    @task.list_id = params[:list_id].to_i
  end

  def create
    @task = Task.new(task_params)
    @task.list_id = params[:list_id].to_i
    @task.save
    redirect_to list_path(@task.list_id)
  end


  def show
    if logged_in?
      @task = Task.find(params[:id])
      @task.list_id = List.find(params[:id])
    end
  end

  def edit
    if logged_in?
      @task = Task.find(params[:id])
    else
      redirect_to '/login'
    end
  end


  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to list_path(@task.list_id)
  end

  def destroy
    @task = Task.find_by(id: params[:id]).destroy
    redirect_to list_path(@task.list_id)
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
