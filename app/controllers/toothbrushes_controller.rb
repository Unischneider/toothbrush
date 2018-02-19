class ToothbrushesController < ApplicationController
  def show
    @toothbrush = Toothbrush.find(:id)
  end
end
