# encoding: utf-8
class ServiceDataUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  process convert: 'jpg'

  # process resize_to_fill: [940, 940]
  # version :slider do
  #   process resize_to_fill: [940, 940]
  # end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    if super.present?
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension.downcase}"
    end
  end


end
