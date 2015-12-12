json.array!(@politicians) do |politician|
  json.extract! politician, :id, :name, :email
  json.url politician_url(politician, format: :json)
end
