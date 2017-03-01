class Booking < ActiveRecord::Base
  belongs_to :room_information
  belongs_to :user
  has_many :book_refs

  # validates :room_information_id, :user_id, :start_date, :end_date, :description, :discount, :total_amount, presence: true
  # validates :total_amount, numericality: {greater_than_or_equal_to: 0.01}
  #end date > start date by atleast one
 #  validate :end_date_is_after_start_date
 #  #start date is equal or more than date.today
	# validates :start_date, date: { after_or_equal_to: Proc.new { Date.today }, 
	# 				   message: "must be equal or greater than #{{(Date.today).to_s}" }"}"}
	
	validates :room_information_id, :user_id, :start_date, :end_date, presence: true

	# start date is equal or greater than today
	validate :start_date_is_equal_or_greater_than_today 
	# end date > start date by atleast one
	validate :end_date_is_after_start_date
	# start date is equal or more than date.today
	validate :end_date_before_or_equal_6_months_from_today

	before_validation :calculate_total_amount
	after_validation :rooms_are_not_over_booked
	# validates :total_amount, numericality: {greater_than_or_equal_to: 0.01}
	# deal with unwanted user facing error
	after_save :auto_fill_bookref_table
	after_destroy :auto_clear_bookref_table 

		def calculate_total_amount
			self.total_amount = self.room_information.price*(1+(discount/100))*quantity*((end_date - start_date).to_i)
		end


	private

		def start_date_is_equal_or_greater_than_today
			return if start_date.blank?
			if start_date < (Date.today)
				errors.add(:start_date, "cannot be a date before today") 
			end 
		end

		def end_date_is_after_start_date
			return if end_date.blank? || start_date.blank?
			if end_date < start_date
				errors.add(:end_date, "cannot be before the start date") 
			end 
		end

		def end_date_before_or_equal_6_months_from_today
			return if end_date.blank?
			if end_date > (Date.today + 6.months)
				errors.add(:end_date, "cannot be more than 6 months") 
			end 
		end

		def rooms_are_not_over_booked
			# debugger
			#implemneted using bookrefs table to keep track of booked rooms on any day
			start_date.upto(end_date-1) do |date|
				# debugger
				final_room_count = ((BookRef.where("booked_date = ? and room_information_id = ?",date,room_information_id).count)+(quantity))
				total_available_room = (Room.where(room_information_id: room_information_id).count)
				difference = final_room_count.to_i - total_available_room.to_i
					
					#old buggy logic
					# 	Booking.where("start_date = ? and room_information_id = ?",
				 	# start_date,room_information_id).sum(:quantity)+(quantity)) > (Room.where(room_information_id: room_information_id).count))
				if difference.to_i >= 1
					errors.add(:quantity, "of room/s requested is not available try with lesser quantity; #{difference} room short on #{date} ")
					return
				end
			end
		end

		def auto_fill_bookref_table
			if BookRef.where(booking_id: id) #to take care of update case.
				BookRef.delete_all(booking_id: id)
			end
			start_date.upto(end_date - 1).each do |date|
				booked_quantity = 0
				while booked_quantity < quantity	
					BookRef.create(booking_id: id, room_information_id: room_information_id ,booked_date: date)
					booked_quantity = booked_quantity + 1
				end
			end
		end

		def auto_clear_bookref_table
			if BookRef.where(booking_id: id) #to take care of destroy case.
				BookRef.delete_all(booking_id: id)
			end
		end

end
