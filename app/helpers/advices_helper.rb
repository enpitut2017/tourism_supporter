module AdvicesHelper
  require 'exifr/jpeg'
  def insert_place advice
    exifdata = EXIFR::JPEG.new "#{Rails.root}/public#{advice.picture.url}"
    lat = exifdata.gps
    if lat == nil
      advice.lat = nil
    else
      advice.lat = lat.latitude.to_f
      advice.lat *= (-1) if exifdata.to_hash[:gps_latitude_ref] == "S"
    end

    lng = exifdata.gps
    if lng == nil
      advice.lng = nil
    else
      advice.lng = lng.longitude.to_f
      advice.lng *= (-1) if exifdata.to_hash[:gps_longitude_ref] == "W"
    end
    return advice
  end
end
