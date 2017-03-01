json.array!(@rooms) do |room|
  json.extract! room, :id, :room_informations_id
  json.url room_url(room, format: :json)
end
