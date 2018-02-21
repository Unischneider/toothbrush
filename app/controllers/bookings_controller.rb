class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

  def index
    @bookings = policy_scope(Booking)
    @reviews = Review.all
    @review = Review.new
  end

  def show
    total_price
    @toothbrush = @booking.toothbrush
    authorize @booking
    authorize @toothbrush
  end

  def new
    @toothbrush = Toothbrush.find(params[:toothbrush_id])
    @booking = Booking.new(user: current_user, toothbrush: @toothbrush)
    # user -> current_user
    # toothbrush -> Toothbrush.find(params[:toothbrush_id])
    authorize @booking
    authorize @toothbrush
  end

  def create
    @toothbrush = Toothbrush.find(params[:toothbrush_id])
    @booking = Booking.new(booking_params)
    @booking.toothbrush = @toothbrush
    @booking.user = current_user
    @booking.status = "Pending owner validation"
    total_price
    authorize @booking
    if @booking.save
      redirect_to toothbrush_booking_path(@toothbrush, @booking)
    else
      render :new
    end
  end

  def update
    @booking.status = "Pending host validation"
    @booking.save!
    redirect_to booking_path(@booking)
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
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
