json.array!(@entities) do |entity|
  json.extract! entity, :id, :pulse_id, :name, :fullname, :address, :description
  json.url entity_url(entity, format: :json)
end
