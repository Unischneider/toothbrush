class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

  def create
    @toothbrush = Toothbrush.find(params[:toothbrush_id])
    @booking = Booking.new(booking_params)
    @booking.toothbrush = @toothbrush
    @booking.user = current_user
    @booking.status = "Pending owner validation"
    if @booking.starting_on && @booking.ending_on
      @booking.total_price = (@booking.ending_on - @booking.starting_on).to_f * @booking.toothbrush.price.to_f
    else
      @booking.total_price = 0
    end
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def index
    @bookings = Booking.where(user_id: current_user.id)
    @review = Review.new
  end

  def show
    total_price
    @toothbrush = @booking.toothbrush
  end

  def update
    @booking.status = "Pending owner validation"
    @booking.save!
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  def new
    @booking = Booking.new
    @toothbrush = Toothbrush.find(params[:toothbrush_id])
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
