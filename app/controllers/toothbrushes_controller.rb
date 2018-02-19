class ToothbrushesController < ApplicationController

  def show
    @toothbrush = Toothbrush.find(params[:id])
  end

  def index
    @toothbrushes = Toothbrush.all
  end
end
