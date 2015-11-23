json.array!(@scrapsites) do |scrapsite|
  json.extract! scrapsite, :id, :nehnutelnosti, :bazos
  json.url scrapsite_url(scrapsite, format: :json)
end
