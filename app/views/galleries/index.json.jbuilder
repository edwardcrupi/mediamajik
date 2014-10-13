json.array!(@galleries) do |gallery|
  json.extract! gallery, :id, :owner, :number_of_images
  json.url gallery_url(gallery, format: :json)
end
