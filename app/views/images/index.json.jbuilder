json.array!(@images) do |image|
  json.extract! image, :id, :length, :width, :title, :caption
  json.url image_url(image, format: :json)
end
