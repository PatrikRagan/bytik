json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :date_of_creation
  json.url comment_url(comment, format: :json)
end
