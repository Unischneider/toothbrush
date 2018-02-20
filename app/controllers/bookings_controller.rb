class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

  def new
    @toothbrush = Toothbrush.find(params[:toothbrush_id])
    @booking = Booking.new(booking_params)
    @booking.toothbrush = @toothbrush
    @booking.user = current_user
    @booking.status = "Pending host validation"

  end

  def index
    @bookings = Booking.where(user_id: current_user.id)
    @reviews = Review.all
    @review = Review.new
  end

  def show
    total_price
    @toothbrush = @booking.toothbrush
  end

  def update
    @booking.status = "Pending host validation"
    @booking.save!
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  private

  def total_price
    if @booking.starting_on && @booking.ending_on
      @booking.total_price = (@booking.ending_on - @booking.starting_on).to_f * @booking.toothbrush.price.to_f
    else
      @booking.total_price = 0
    end
    @booking.save
  end

  def booking_params
    params.require(:booking).permit(:starting_on, :ending_on, :total_price, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
