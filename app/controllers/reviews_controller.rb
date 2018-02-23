class ReviewsController < ApplicationController
    before_action :set_booking, only: [:new, :create, :edit, :update]
  def new
    @review = Review.new
    authorize @review

  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @review.booking = @booking
    @review.save
    redirect_to bookings_path
  end

  def edit
    authorize @booking
  end

  def update
    @review = Review.new(review_params)
    authorize @review
    @booking.review = @review
    if @review.update(valid_params)
      redirect_to bookings_path
    else
      render :edit
    end
    authorize @booking
  end

  private
  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

