class ListsController < ApplicationController
#where info is collected


  def create
    @list = List.new(list_params)
    @list.valid?
    # raise @list.errors.full_messages.inspect
    @list.save
    # binding.pry
    redirect_to @list
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    # binding.pry
  end

  def new
    @list = List.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def list_params
    params.require(:list).permit(:title, :status)
  end
end
