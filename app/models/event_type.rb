#encoding: utf-8
class EventType
  attr_accessor :name
  attr_accessor :code

  def self.collection
    list = [
        EventType.new(:name => 'Анонс', :code => 1),
        EventType.new(:name => 'Репортаж', :code => 2),
        EventType.new(:name => 'Обзор', :code => 3)
    ]
    list
  end

  def self.include?(code)
    collection.each do |type|
      return true if type.code == code
    end
    false
  end

  def self.by_code(code)
    collection.each do |value|
      return value.name if value.code == code
    end
    false
  end

  def self.code_by_name(name)
    collection.each do |value|
      return value.code if value.name == name
    end
    0
  end

  def initialize(hash)
    self.name = hash[:name]
    self.code = hash[:code]
  end

end