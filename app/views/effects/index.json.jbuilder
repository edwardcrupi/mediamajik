json.array!(@effects) do |effect|
  json.extract! effect, :id, :name
  json.url effect_url(effect, format: :json)
end
