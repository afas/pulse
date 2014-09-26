xml.instruct!
xml.publications do
  @publications.each do |publication|
    xml.publication do
      xml.scale publication.scale
      xml.region publication.region
      xml.address publication.address
      xml.latitude publication.latitude
      xml.longitude publication.longitude
      xml.date_start publication.date_start
      xml.date_end publication.date_end
      xml.author_id publication.author_id
      xml.publication_status publication.publication_status
      xml.date_publish publication.date_publish
      xml.date_archive publication.date_archive
      xml.publisher_id publication.publisher_id
      xml.publication_type publication.publication_type
      xml.category publication.category
      xml.title publication.title
      xml.subtitle publication.subtitle
      xml.body publication.body

      xml.attachments do
        publication.publication_attachments.each do |attachment|
          xml.attachement do
            xml.image_url attachment.image_url
            xml.title attachment.title
          end
        end
      end

    end
  end
end