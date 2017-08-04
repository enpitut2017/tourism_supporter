module SpotsHelper

  def create_url(lat = '',lng = '')
    base_url = "https://maps.google.com/maps?q="
    base_url + lat.to_s + "," + lng.to_s
  end
end
