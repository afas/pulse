#encoding: utf-8
class Status
  attr_accessor :name
  attr_accessor :code

  def self.collection(admin)
    list = [
        Status.new(:name => 'Черновик', :code => 4),
        Status.new(:name => 'Подготовлена', :code => 5),
    ]
    list = [
        Status.new(:name => 'Пульс', :code => 1),
        Status.new(:name => 'Опубликована', :code => 2),
        Status.new(:name => 'Отвергнута', :code => 3)
    ] + list if admin
    list
  end

  def self.include?(code)
    collection.each do |status|
      return true if status.code == code
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