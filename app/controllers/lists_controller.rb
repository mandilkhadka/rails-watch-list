class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(strong_list)
    if @list.save
      redirect_to lists_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @list = List.find(params[:id])
  end

  private

  def strong_list
    params.require(:list).permit(:name)
  end
end
