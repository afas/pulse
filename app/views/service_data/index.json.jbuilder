json.array!(@service_data) do |service_datum|
  json.extract! service_datum, :id
  json.url service_datum_url(service_datum, format: :json)
end
