json.array!(@togs) do |tog|
  json.extract! tog, :id
  json.url tog_url(tog, format: :json)
end
