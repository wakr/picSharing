json.array!(@pictures) do |picture|
  json.extract! picture, :id, :uploaded, :url, :score
  json.url picture_url(picture, format: :json)
end
