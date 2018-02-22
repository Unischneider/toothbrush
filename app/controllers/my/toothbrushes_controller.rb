class My::ToothbrushesController < ApplicationController
  def index
    @toothbrushes = policy_scope(Toothbrush).where(user: current_user)
  end
end
