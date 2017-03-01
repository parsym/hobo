class RoomInformation < ActiveRecord::Base
	has_many :rooms
	before_destroy :ensure_not_referenced_by_any_room
	
	validates :room_type, :description, :price, presence: true
	validates :room_type, uniqueness: true
	validates :description, length: {minimum: 10}
	validates :price, numericality: {greater_than_or_equal_to: 0.01}

	protected
	
	def ensure_not_referenced_by_any_room
		if rooms.empty?
			return true
		else
			errors.add(:base, 'room present with this room type')
			return false
		end
	end
end
