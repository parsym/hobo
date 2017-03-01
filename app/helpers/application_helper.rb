module ApplicationHelper
	def room_type_options
		options_for_select(RoomInformation.all.map{|type| [type.room_type , type.id]})
	end
end
