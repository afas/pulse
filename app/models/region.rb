class Region < ActiveRecord::Base

  scope :published, -> { where(public: true) }

  def self.import_local
    require 'nokogiri'
    xml = Nokogiri::XML(File.open("public/import/regions.xml"))
    regions = xml.xpath("//region")
    regions.each do |region|
      name = region.xpath("Name").text
      code = region.xpath("Code").text.to_i
      Region.create(name: name, code: code)
    end
  end

end
