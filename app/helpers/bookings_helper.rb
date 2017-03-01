module BookingsHelper
	def active_bookings
		Booking.where("user_id = ? and start_date >= ?", current_user.id, Date.today)
	end

	def expired_bookings
		Booking.where("user_id = ? and start_date < ?", current_user.id, Date.today)
	end

end
