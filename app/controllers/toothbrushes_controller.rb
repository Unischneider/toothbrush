class ToothbrushesController < ApplicationController
<<<<<<< HEAD
  def show
    @toothbrush = Toothbrush.find(params[:id])
=======
  def index
    @toothbtushes = Toothbrush.all
>>>>>>> master
  end
end
