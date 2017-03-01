# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Room.delete_all
RoomInformation.delete_all
Booking.delete_all
BookRef.delete_all
User.delete_all


deluxe_room = RoomInformation.create!(room_type: "Deluxe Room", description: "Queen Size Bed", price: 7000)
luxury_room = RoomInformation.create!(room_type: "Luxury Room", description: "Queen Size Bed and Pool Facing", price: 8500)
luxury_suite = RoomInformation.create!(room_type: "Luxury Suite", description: "King Size Bed and Pool Facing", price: 12000)
presidential_suite = RoomInformation.create!(room_type: "Presidential Suite", description: "King Size Bed, Pool Facing with a Gym", price: 20000)

room_A01 = deluxe_room.rooms.create!(room_number: "A01")
room_A02 = deluxe_room.rooms.create!(room_number: "A02")
room_A06 = luxury_room.rooms.create!(room_number: "A06")
room_D11 = luxury_suite.rooms.create!(room_number: "D11")
room_E03 = presidential_suite.rooms.create!(room_number: "E03")