class ToothbrushesController < ApplicationController

  def show
    @toothbrush = Toothbrush.find(params[:id])

  def index
    @toothbrushes = Toothbrush.all

  end
end
