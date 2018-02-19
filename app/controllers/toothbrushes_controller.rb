class ToothbrushesController < ApplicationController

  def show
    @toothbrushes = Toothbrush.all
  end

end
