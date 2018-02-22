class My::BedsController < ApplicationController
  def index
    @toothbrushes = current_user.toothbrushes
  end
end
