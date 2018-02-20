class ToothbrushesController < ApplicationController

  def show
    @toothbrush = Toothbrush.find(params[:id])
  end

  def index
    @toothbrushes = Toothbrush.all
  end

  def new
    @toothbrush = Toothbrush.new
  end

  def create
    @toothbrush = Toothbrush.new(valid_params)
    if @toothbrush.save
      redirect_to toothbrush_path(@toothbrush)
    else
      render :new
    end
  end

  private

  def valid_params
    params.require(:toothbrush).permit(:name, :photo, :age, :people, :uses, :price, :material)
  end
end
