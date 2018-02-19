class ToothbrushesController < ApplicationController
  def index
    @toothbtushes = Toothbrush.all
  end
end
