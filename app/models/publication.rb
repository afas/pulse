class Publication < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode

  belongs_to :author, :class_name => 'User'
  belongs_to :publisher, :class_name => 'Entity'
  has_many :publication_attachments, :inverse_of => :publication, :dependent => :destroy
  accepts_nested_attributes_for :publication_attachments

  has_many :service_datums, :inverse_of => :publication, :dependent => :destroy
  accepts_nested_attributes_for :service_datums

  default_scope { order(date_publish: :desc) }
end
