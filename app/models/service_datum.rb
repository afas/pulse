class ServiceDatum < ActiveRecord::Base
  mount_uploader :image, ServiceDataUploader
  belongs_to :publication

end
