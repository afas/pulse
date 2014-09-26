#encoding: utf-8
class Scale
  attr_accessor :name
  attr_accessor :code

  def self.collection
    list = [
        Scale.new(:name => 'Федеральные', :code => 1),
        Scale.new(:name => 'Региональные', :code => 2),
        Scale.new(:name => 'Местные', :code => 3)
    ]
    list
  end

  def self.include?(code)
    collection.each do |scale|
      return true if scale.code == code
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