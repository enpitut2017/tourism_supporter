require 'uri'
require 'active_support/core_ext'
module SpotsHelper

  def show_map_url(lat = '',lng = '')
    uri = URI(Settings.show_map.url)
    uri.query = {
      q: lat.to_s + "," + lng.to_s
    }.to_param
    uri.to_s
  end

  def designate_map_url()
    uri = URI(Settings.google_map_api.url)
    uri.query = {
      key: Settings.google_map_api.key,
      callback: "initMap"
    }.to_param
    uri.to_s
  end
end
