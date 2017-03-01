require 'test_helper'

class RoomInformationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "cannot delete roomtype when room of that type present" do
  	deluxe_room = RoomInformation.create!(room_type: "Unique_new_room_type", description: "Queen Size Bed", price: 7000)
  	room_A01 = deluxe_room.rooms.create!(room_number: "Unique_new_room_number")
  	deluxe_room.destroy
  	deluxe_room.reload
  	assert_not_empty( deluxe_room.room_type )
  end

  test "can delete roomtype when room of that type is not present" do
  	deluxe_room = RoomInformation.create!(room_type: "Unique_new_room_type", description: "Queen Size Bed", price: 7000)
  	# room_A01 = deluxe_room.rooms.create!(room_number: "A01")
  	deluxe_room.destroy
  	assert_raise(ActiveRecord::RecordNotFound) {deluxe_room.reload}
  	# assert_empty( deluxe_room.room_type ) the obj maintains the old copy when reload from database fails and hence its not empty
  end
end
