class Region < ActiveRecord::Base

  scope :published, -> { where(public: true) }

  def self.import
    require 'nokogiri'
    require 'open-uri'

    xml = Nokogiri::XML(open("ftp://farforov:clBuS9Hre@ftp.sistems.ru/regions.xml"))
    regions = xml.xpath("//region")
    regions.each do |region|
      name = region.xpath("Name").text
      code = region.xpath("Code").text.to_i
      Region.create(name: name, code: code)
    end
  end

end
