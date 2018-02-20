class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @toothbrushes = Toothbrush.all.first(4)
    @review = Review.all.first(3)
  end

end
