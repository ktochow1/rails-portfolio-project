class ListsController < ApplicationController
#where info is collected


  def create
    @list = List.create(list_params)

    @list.user_id = current_user
    @list.save
    # binding.pry
    redirect_to @list
  end

  def index
    if authorized
      @lists = List.all
    else
      redirect_to '/login'
    end
  end

  def show
    if authorized
      @list = List.find(params[:id])
    else
      redirect_to '/login'
    end
  end

  def new
    if authorized
      @list = List.new
    else
      redirect_to '/login'
    end
  end

  def edit
    if authorized
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
    @list = List.find_by(params[:id]).destroy
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:title, :status)
  end
end
