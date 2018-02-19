class ToothbrushesController < ApplicationController
  def show
    @toothbrush = Toothbrush.find(params[:id])
  end
end
