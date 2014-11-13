class Entity < ActiveRecord::Base
  default_scope { order(name: :desc) }

  def self.import_local
    xml = Nokogiri::XML(File.open("public/import/orgs.xml"))
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
      Entity.create(pulse_id: pulse_id, name: name, fullname: fullname.truncate(250, separator: /\s/), address: address.join("; ").truncate(250, separator: /\s/), description: description.join("; "))
    end
  end

end
