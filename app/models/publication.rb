class Publication < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  # belongs_to :author, :class_name => 'User'
  # belongs_to :publisher, :class_name => 'Entity'
  # accepts_nested_attributes_for :publication_attachments

  belongs_to :region
  # belongs_to :region, primary_key: :code
  has_many :publication_attachments #, :inverse_of => :publication, :dependent => :destroy

  has_and_belongs_to_many :entities

  # has_many :publication_to_publications, :foreign_key => :publication_from_id
  # http://stackoverflow.com/questions/2168442/many-to-many-relationship-with-the-same-model-in-rails

  has_many :service_datums, :inverse_of => :publication, :dependent => :destroy
  accepts_nested_attributes_for :service_datums

  default_scope { order(date_start: :desc) }

  def self.import
    require 'nokogiri'
    require 'open-uri'

    xml = Nokogiri::XML(open("ftp://farforov:clBuS9Hre@ftp.sistems.ru/events.xml"))
    # xml = Nokogiri::XML(File.open("public/import/events.xml"))

    events = xml.xpath("//event")
    events.each do |event|
      pulse_id = event.xpath("Number").text.to_i
      author = event.xpath("Link/Autor").text.to_s

      date_start = event.xpath("Link/Dateonly").text.to_date
      time_start = "#{event.xpath("Link/Dateonly").text} #{event.xpath("Link/Timeonly").text}".to_time

      region_id = Region.find_by_number(event.xpath("Link/Region").text).id

      category = Category.code_by_name(event.xpath("Link/Vid").text)
      publication_type = EventType.code_by_name(event.xpath("Link/Type").text)

      title = event.xpath("Link/Header").text.to_s
      subtitle = event.xpath("Link/Summary").text.to_s
      body = event.xpath("Link/AText").text

      address = ''
      address += "#{event.xpath("Link/Local").text}" unless event.xpath("Link/Local").text.empty?
      address += " #{event.xpath("Link/Concrete").text}" unless event.xpath("Link/Concrete").text.empty?

      date_archive = event.xpath("Link/DateUntil").text.to_date

      publication = Publication.create(
          pulse_id: pulse_id,
          author: author,
          date_start: date_start,
          time_start: time_start,
          date_archive: date_archive,
          region_id: region_id,
          category: category,
          publication_type: publication_type,
          title: title,
          subtitle: subtitle,
          body: body,
          address: address
      )

      image = event.xpath("Link/image").text
      publication.publication_attachments.create(title: title, image: open("ftp://farforov:clBuS9Hre@ftp.sistems.ru/images/#{image}"))
      # publication.publication_attachments.create(title: title, image: open("ftp://farforov:clBuS9Hre@ftp.sistems.ru/images/#{image}"))

      publication_entity = event.xpath("Link/AOrg/XRef/Number").text
      publication.entities << Entity.find_by_pulse_id(publication_entity)
    end
  end


end
