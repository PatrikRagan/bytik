json.array!(@userdetails) do |userdetail|
  json.extract! userdetail, :id, :nick, :notifications_allowed
  json.url userdetail_url(userdetail, format: :json)
end
