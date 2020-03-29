class ListsController < ApplicationController
#where info is collected
  def create
    @list = List.create(list_params)
    binding.pry
    # @list.user_id = current_user.id
    @list.save
    redirect_to @list
  end

  def index
    if logged_in?
      @lists = List.all
     else
      redirect_to '/login'
    end
  end

  def show
    # binding.pry
    if logged_in?
      @user = current_user
      @list = List.find_by(params[:id])
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
    binding.pry
    @list = List.find_by(params[:id]).destroy!
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:title, :status) #ommitted user_id = []
  end
end
