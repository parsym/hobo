json.array!(@bookings) do |booking|
  json.extract! booking, :id, :room_id, :user_id, :start_date, :end_date, :discount, :total_amount
  json.url booking_url(booking, format: :json)
end
