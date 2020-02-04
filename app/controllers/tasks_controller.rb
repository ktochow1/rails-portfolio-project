class TasksController < ApplicationController


  def new
    @task = Task.new
  end

  def create
    @task = Task.create(:title(params[:title]))
  end

  def update
  end

  def delete
  end

  def index
    @tasks = Task.all
  end
end
