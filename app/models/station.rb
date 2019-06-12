class Station < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  require 'net/http'

  def last_updated_in_human
    distance_of_time_in_words(self.last_updated, Time.now)
  end

  def as_json options={}
    {
      id: id,
      name: name,
      empty_slots: empty_slots,
      free_bikes: free_bikes,
      last_updated: last_updated_in_human
    }
  end

  def self.update_info
    url = 'http://api.citybik.es/v2/networks/bikesantiago'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    json = JSON.parse(response)
    free_bikes = 0
    used_bikes = 0
    json['network']['stations'].each do |station|
      s = Station.find_or_create_by(name: station['name'])

      station_empty_slots = station['empty_slots'].to_i
      s.empty_slots = station_empty_slots

      station_free_bikes = station['free_bikes'].to_i
      s.free_bikes = station_free_bikes

      s.last_updated = Time.at(station['extra']['last_updated'].to_i)
      s.save

      free_bikes += station_free_bikes
      used_bikes += station_empty_slots
    end
    SystemUsage.create_with(free_bikes, used_bikes, Time.now.min)
  end
end
