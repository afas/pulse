class Region < ActiveRecord::Base

  scope :published, -> { where(public: true) }

  def self.import
    require 'nokogiri'
    require 'open-uri'

    xml = Nokogiri::XML(open("ftp://farforov:clBuS9Hre@ftp.sistems.ru/regions.xml"))
    regions = xml.xpath("//region")
    regions.each do |region|
      number = region.xpath("Number").text.to_i
      name = region.xpath("Name").text
      code = region.xpath("Code").text.to_i
      Region.create(number: number, name: name, code: code)
    end

    Region.where("code in (37, 44, 76)").each do |region|
      region.public = true
      region.save
    end
  end

end
