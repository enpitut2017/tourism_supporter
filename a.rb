require 'exifr/jpeg'
require 'pp'

exifdata = EXIFR::JPEG.new("test.jpeg")

pp exifdata.to_hash
