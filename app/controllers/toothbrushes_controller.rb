class ToothbrushesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
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
    @toothbrush.user = current_user
    if @toothbrush.save
      redirect_to toothbrush_path(@toothbrush)
    else
      render :new
    end
  end

  private

  def valid_params
    params.require(:toothbrush).permit(:name, :photo, :age, :people, :uses, :price, :material, :brush_strength, :description)
  end
end
