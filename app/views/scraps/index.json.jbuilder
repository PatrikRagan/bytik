json.array!(@scraps) do |scrap|
  json.extract! scrap, :id, :city, :part_of_town, :room_count, :keywords, :price_min, :price_max, :last_search_time, :number_of_results, :time_of_result_expiration
  json.url scrap_url(scrap, format: :json)
end
