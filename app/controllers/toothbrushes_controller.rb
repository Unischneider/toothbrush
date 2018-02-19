class ToothbrushesController < ApplicationController

  def show
    @toothbrush = Toothbrush.find(params[:id])
  end

  def index
    @toothbtushes = Toothbrush.all
  end
end
