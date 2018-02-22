class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @toothbrushes = Toothbrush.all.first(4)
    @review = Review.all.first(3)

    @user = User.where.not(latitude: nil, longitude: nil)

    @markers = @user.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        # infoWindow: { content: render_to_string(partial: "/toothbrush/map_box", locals: { flat: flat }) }
        icon: ActionController::Base.helpers.image_url('pointer.png')
      }
    end
  end
end
