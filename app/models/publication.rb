class Publication < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  belongs_to :author, :class_name => 'User'
  belongs_to :publisher, :class_name => 'Entity'
  has_many :publication_attachments, :inverse_of => :publication, :dependent => :destroy
  accepts_nested_attributes_for :publication_attachments

  has_many :service_datums, :inverse_of => :publication, :dependent => :destroy
  accepts_nested_attributes_for :service_datums

  default_scope { order(date_publish: :desc) }

  def self.import_local
    #xml = Nokogiri::XML(open("http://www.kongregate.com/games_for_your_site.xml"))
    xml = Nokogiri::XML(File.open("public/import/events.xml"))
    events = xml.xpath("//event")
    events.each do |event|

      pulse_id = event.xpath("Number").text.to_i
      author = event.xpath("Link/Autor").text

      date_start = event.xpath("Link/Autor").text
      time_start = event.xpath("Link/Autor").text

      # <Dateonly>19.09.2014</Dateonly>
      # <Timeonly>10:00</Timeonly>


          pulse_id = entity.xpath("Number").text
      name = entity.xpath("System/Name").text
      fullname = entity.xpath("Link/FullName").text


      address = []
      aaddress = entity.xpath("Link/AAddress/Address")
      aaddress.each do |addr|
        address.push("#{addr.xpath("Index").text}, #{addr.xpath("Local").text}, #{addr.xpath("Concrete").text} (#{addr.xpath("Rem").text})")
      end

      description = []
      adescription = entity.xpath("Link/AWork/Work")
      adescription.each do |desc|
        description.push("#{desc.xpath("Name").text} (#{desc.xpath("Type").text})")
      end

      # Publication
      Entity.create(pulse_id: pulse_id, name: name, fullname: fullname, address: address.join("; "), description: description.join("; "))

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
