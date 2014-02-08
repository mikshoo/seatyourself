class ReservationController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def edit
    @reservation = Reservation.find(parms[:id])
  end

  def create
    @reservation = Reservation.new(product_params)

    if @reservation.save
        redirect_to reservation_url
    else
        render :new
    end
end

    def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attriutes(product_params)
        redirect_to reservation_path(@reservation)
    else
        render :edit
    end
end

    def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservation_path
    end

    private
    def reservation_params
        params.require(:reservation).permit(:slot, :restaurant_id, :customer_id)
    end
end


