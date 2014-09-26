json.array!(@publications) do |publication|
  json.extract! publication, :id, :scale, :region, :address, :latitude, :longitude, :date_start, :date_end, :author_id, :date_publish, :date_archive, :publisher_id, :type, :category, :title, :subtitle, :body
  json.url publication_url(publication, format: :json)
end
