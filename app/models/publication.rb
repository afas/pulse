class Publication < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  # belongs_to :author, :class_name => 'User'
  # belongs_to :publisher, :class_name => 'Entity'
  has_many :publication_attachments#, :inverse_of => :publication, :dependent => :destroy
  # accepts_nested_attributes_for :publication_attachments

  belongs_to :region

  has_many :service_datums, :inverse_of => :publication, :dependent => :destroy
  accepts_nested_attributes_for :service_datums

  default_scope { order(date_start: :desc) }

  def self.import
    require 'nokogiri'
    require 'open-uri'

    # server = "ftp.sistems.ru"
    # user = "farforov"
    # password = "clBuS9Hre"

    #xml = Nokogiri::XML(open("ftp://farforov:clBuS9Hre@ftp.sistems.ru/images/event_00000010.jpg"))
    #xml = Nokogiri::XML(open("ftp://#{user}:#{password}@#{server}/events.xml"))
    #xml = Nokogiri::XML(open("http://www.kongregate.com/games_for_your_site.xml"))

    xml = Nokogiri::XML(open("ftp://farforov:clBuS9Hre@ftp.sistems.ru/events.xml"))
    events = xml.xpath("//event")
    events.each do |event|
      pulse_id = event.xpath("Number").text.to_i
      author = event.xpath("Link/Autor").text.to_s

      date_start = event.xpath("Link/Dateonly").text.to_date
      time_start = "#{event.xpath("Link/Dateonly").text} #{event.xpath("Link/Timeonly").text}".to_time

      region_id = event.xpath("Link/Region").text.to_i

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
      # publication.publication_attachments.create(title: title, image: open("ftp://#{user}:#{password}@#{server}/images/#{image}"))

      # address = []
      # aaddress = entity.xpath("Link/AAddress/Address")
      # aaddress.each do |addr|
      #   address.push("#{addr.xpath("Index").text}, #{addr.xpath("Local").text}, #{addr.xpath("Concrete").text} (#{addr.xpath("Rem").text})")
      # end

      # description = []
      # adescription = entity.xpath("Link/AWork/Work")
      # adescription.each do |desc|
      #   description.push("#{desc.xpath("Name").text} (#{desc.xpath("Type").text})")
      # end


      # Publication


      # t.integer  "region_id"
      # t.string   "address"
      # t.float    "latitude"
      # t.float    "longitude"
      # t.date     "date_start"
      # t.time     "time_start"
      # t.integer  "author_id"
      # t.string   "author"
      # t.datetime "date_publish"
      # t.datetime "date_archive"
      # t.integer  "publication_status", default: 4
      # t.integer  "publisher_id"
      # t.integer  "publication_type"
      # t.integer  "category"
      # t.string   "title"
      # t.string   "subtitle"
      # t.text     "body"
      # t.text     "comment"
      # t.datetime "created_at"
      # t.datetime "updated_at"
      # t.integer  "pulse_id"
    end
  end


end
