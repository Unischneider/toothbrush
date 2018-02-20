class ToothbrushesController < ApplicationController

  def show
    @toothbrush = Toothbrush.find(params[:id])
  end

  def index
    @toothbrushes = policy_scope(Toothbrush)
  end

  def new
    @toothbrush = Toothbrush.new
    authorize @toothbrush
  end

  def create
    authorize @toothbrush
    @toothbrush = Toothbrush.new(valid_params)
    if @toothbrush.save
      redirect_to toothbrush_path(@toothbrush)
    else
      render :new
    end
  end

  def update
    authorize @toothbrush
  end

  private

  def valid_params
    params.require(:toothbrush).permit(:name, :photo, :age, :people, :uses, :price, :material)
  end
end
