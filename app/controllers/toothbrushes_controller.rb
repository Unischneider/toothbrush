class ToothbrushesController < ApplicationController

  def show
    @toothbrush = Toothbrush.find(params[:id])

  def index
    @toothbtushes = Toothbrush.all

  end
end
