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
    @list = List.find(params[:id])
  end

  def update
    # raise params.inspect
    @list = List.find(params[:id])
    # binding.pry
    @list.update(params.require(:list).permit(:title, :status))
      redirect_to @list
    # else
      # render :action => 'update'
    # end
  end

  def destroy
    @list = List.find_by(params[:id]).destroy
    redirect_to new_list_path
  end

  private
  def list_params
    params.require(:list).permit(:title, :status)
  end
end
