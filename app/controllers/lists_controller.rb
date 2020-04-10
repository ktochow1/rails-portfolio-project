class ListsController < ApplicationController
  def create
    @list = List.create(list_params)
    @list.save
    redirect_to lists_path
  end

  def index
    if logged_in?
      @lists = List.all
     else
      redirect_to '/login'
    end
  end

  def show
    if logged_in?
      @list = List.find_by(id: params[:id])
      @task = Task.find_by(id: params[:id])
    else
      redirect_to '/login'
    end
  end

  def new
    @list = List.new
  end

  def edit
    if logged_in?
      @list = List.find(params[:id])
    else
      redirect_to '/login'
    end
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to @list
  end

  def destroy
    @list = List.find(params[:id]).destroy!
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:title, :status)
  end
end
