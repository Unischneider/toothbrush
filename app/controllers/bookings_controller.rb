class BookingsController < ApplicationController

  def index
    @toothbrushes = Toothbrush.all
  end

  def show
    @toothbrush = Toothbrush.find(params[:id])
  end

  def new
    @toothbrush = Toothbrush.new
  end
end
