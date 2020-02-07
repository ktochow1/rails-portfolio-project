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
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def edit
  end

  def update
  end

  def destroy #LISTCONTROLLER
    # binding.pry
    @list = List.find(params[:id]).destroy

    redirect_to list_url
  end

  private
  def list_params
    params.require(:list).permit(:title, :status)
  end
end
