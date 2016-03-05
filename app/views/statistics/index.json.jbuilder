json.array!(@statistics) do |statistic|
  json.extract! statistic, :id, :suggested_price, :result
  json.url statistic_url(statistic, format: :json)
end
