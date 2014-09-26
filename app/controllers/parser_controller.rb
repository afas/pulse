class ParserController < ApplicationController
  # load_and_authorize_resource

  #  для получения контента через http
  #  require 'open-uri'
  # подключаем Nokogiri
  require 'nokogiri'

  def pulse
    #xml = Nokogiri::XML(open("http://www.kongregate.com/games_for_your_site.xml"))
    xml = Nokogiri::XML(File.open("public/uploads/pulse.xml"))
    entities = xml.xpath("//card")
    entities.each do |entity|
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

      Entity.create(pulse_id: pulse_id, name: name, fullname: fullname, address: address.join("; "), description: description.join("; "))
    end
  end

end
