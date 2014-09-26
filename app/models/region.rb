#encoding: utf-8
class Region
  attr_accessor :name
  attr_accessor :code

  def self.collection
    list = [
        Region.new(:name => 'РФ, Ивановская область', :code => 37),
        Region.new(:name => 'РФ, Костромская область', :code => 44),
        Region.new(:name => 'РФ, Ярославская область', :code => 76)
    ]
    list
  end

  def self.include?(code)
    collection.each do |region|
      return true if region.code == code
    end
    false
  end

  def self.by_code(code)
    collection.each do |value|
      return value.name if value.code == code
    end
    false
  end

  def initialize(hash)
    self.name = hash[:name]
    self.code = hash[:code]
  end

end