json.array!(@flats) do |flat|
  json.extract! flat, :id, :name, :content, :price, :date, :room, :date_of_creation
  json.url flat_url(flat, format: :json)
end
