class Room < ActiveRecord::Base
  belongs_to :room_information
  has_many :bookings

  validates :room_number, :room_information_id, presence: true
  validates :room_number, uniqueness: true

  scope :total_rooms_of_type, -> (type) {where("room_information_id = ?", type).count}
end
