class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [555, 555]
  version :thumb_large do
    process resize_to_fill: [555, 555]
  end

  version :thumb_nail,from_version: :thumb_large  do
    process resize_to_fill: [210, 210]
  end

  version :thumb_nail_1,from_version: :thumb_nail  do
    process resize_to_fill: [187, 128]
  end

  version :thumb, from_version: :thumb_nail do
    process resize_to_fill: [90, 90]
  end
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end


end
