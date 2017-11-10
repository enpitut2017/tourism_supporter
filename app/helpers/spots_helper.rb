require 'uri'
require 'active_support/core_ext'
module SpotsHelper

  def create_url(lat = '',lng = '')
    base_url = "https://maps.google.com/maps?q="
    base_url + lat.to_s + "," + lng.to_s
  end

  def googlemap_url()
    uri = URI(Settings.google_map_api.url)
    uri.query = {
      key: Settings.google_map_api.key,
      callback: "initMap"
    }.to_param
    uri.to_s
  end
end
