json.array!(@room_informations) do |room_information|
  json.extract! room_information, :id, :room_type, :description, :price
  json.url room_information_url(room_information, format: :json)
end
