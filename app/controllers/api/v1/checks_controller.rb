class Api::V1::ChecksController < Api::V1::BaseController
  def show
    booking = Booking.find(params[:id])
    render(json: Api::V1::ChecksSerializer.new(booking).to_json)
  end

  def index
    booking = Booking.all

    render(
      json: ActiveModel::ArraySerializer.new(
        users,
        each_serializer: Api::V1::ChecksSerializer,
        root: 'bookings',
      )
    )
  end

  def create
  	booking = Booking.where("room_information_id = ?", params[:room_information_id])
  end
end
