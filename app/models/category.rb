#encoding: utf-8
class Category
  attr_accessor :name
  attr_accessor :code

  def self.collection
    list = [
        Category.new(:name => 'Производство', :code => 1),
        Category.new(:name => 'Торговля', :code => 2),
        Category.new(:name => 'Услуги', :code => 3),
        Category.new(:name => 'Власть', :code => 4),
        Category.new(:name => 'Общество', :code => 5)
    ]
    list
  end

  def self.include?(code)
    collection.each do |category|
      return true if category.code == code
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