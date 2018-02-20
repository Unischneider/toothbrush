class BookingsController < ApplicationController

  def new
    @toothbrush = Toothbrush.find(params[:toothbrush_id])
    @booking = Booking.new(booking_params)
    @booking.toothbrush = @toothbrush
    @booking.user = current_user
    @booking.status = "Pending host validation"
    if @booking.starting_on && @booking.ending_on
      @booking.total_price = (@booking.ending_on - @booking.starting_on).to_f * @booking.toothbrush.price.to_f
    else
      @booking.total_price = 0
    end
    if @booking.save
      redirect_to booking_path(@booking)
    else
      redirect_to toothbrush_path(@bed)
    end
  end

  def index
    @bookings = Booking.where(user_id: current_user.id)
    @review = Review.new
  end

  def show
    set_booking
    @toothbrush = @booking.toothbrush
  end

  def update
    set_booking
    @booking.status = "Pending host validation"
    @booking.save!
    redirect_to booking_path(@booking)
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_on, :ending_on, :total_price, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
