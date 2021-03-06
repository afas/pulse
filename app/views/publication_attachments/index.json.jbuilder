json.array!(@publication_attachments) do |publication_attachment|
  json.extract! publication_attachment, :id, :publication_id, :title, :image
  json.url publication_attachment_url(publication_attachment, format: :json)
end
