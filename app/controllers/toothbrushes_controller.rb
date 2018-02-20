class ToothbrushesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def show
    @toothbrush = Toothbrush.find(params[:id])
    authorize @toothbrush
  end

  def index
    @toothbrushes = policy_scope(Toothbrush)
  end

  def new
    @toothbrush = Toothbrush.new
    authorize @toothbrush
  end

  def create
    @toothbrush = Toothbrush.new(valid_params)
    authorize @toothbrush
    if @toothbrush.save
      redirect_to toothbrush_path(@toothbrush)
    else
      render :new
    end
  end

  def update
    authorize @toothbrush
  end

  def destroy
    @toothbrush = Toothbrush.find(params[:id])
    @toothbrush.destroy
    authorize @toothbrush
  end

  private

  def valid_params
    params.require(:toothbrush).permit(:name, :photo, :age, :people, :uses, :price, :material)
  end
end
