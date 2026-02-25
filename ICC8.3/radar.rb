# radar.rb

class Radar
  def initialize(radar_id, params)
        @radar_id = radar_id
        @parameters = params
  end

  def position
    [@radar_id, @parameters['latitude'], @parameters['longitude']]
  end

  # ... more methods ...
end

params = {
  'latitude' => 1,
  'longitude' => 2,
  'altitude_meters' => 3,
  'sweep_angle_degrees' => 4,
  'sweep_speed_rpm' => 5,
  'max_range_km' => 6,
  'min_range_km' => 7,
  'transmit_power_watts' => 8,
  'frequency_mhz' => 9,
  'pulse_width_microseconds' => 10,
  'pulse_repetition_frequency' => 11
}

r = Radar.new(2, params)

pp r.position