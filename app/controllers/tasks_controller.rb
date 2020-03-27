class TasksController < ApplicationController


  def new
      binding.pry
      @task = Task.new
      @task.list_id = params[:list_id].to_i
      # binding.pry
      # @task.list_id = List.find(params[:id])

  end

  def create
      binding.pry
      # @task.list_id = Task.find(params[:list_id])
      @task = Task.new(task_params)
      # binding.pry
      # @task.list_id = List.find(params[:id])
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
