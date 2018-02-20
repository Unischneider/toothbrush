class PagesController < ApplicationController
  def home
    @toothbrushes = Toothbrush.all.first(4)
    @review = Review.all.first(3)
  end

end
