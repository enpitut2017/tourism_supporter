module AdvicesHelper
  def insert_place advice
    exifdata = MiniExiftool.new "#{Rails.root}/public#{advice.picture.url}"
    lat = exifdata['GPSLatitude']
    if lat == nil
      advice.lat = nil
    else
      lat = lat.split(" ")
      advice.lat = lat[0].to_f + lat[2].to_f / 60 + lat[3].to_f / 3600
      advice.lat *= (-1) if lat[4] == "S"
    end

    lng = exifdata['GPSLongitude']
    if lng == nil
      advice.lng = nil
    else
      lng = lng.split(" ")
      advice.lng = lng[0].to_f + lng[2].to_f / 60 + lng[3].to_f / 3600
      advice.lng *= (-1) if lng[4] == "W"
    end

    return advice
  end
end
