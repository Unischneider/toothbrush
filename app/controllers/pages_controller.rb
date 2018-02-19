class PagesController < ApplicationController
  def home
    @toothbrushes = Toothbrush.all.first(4)
    @review = Review.all.first(4)
  end

end
