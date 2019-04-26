require 'yaml'
require 'pry'
require 'dijkstra'

class MetroInfopoint
  def initialize(path_to_timing_file: './config/timing4.yml', path_to_lines_file: './config/config.yml')
    # initialization here
    @path_to_timing_file = path_to_timing_file
    @path_to_lines_file = path_to_lines_file
  end

  def timing
    YAML.load_file(@path_to_timing_file)['timing']
  end


  def lines
    YAML.load_file(@path_to_lines_file)
  end

  def timing_graph
data = MetroInfopoint.new.timing
data.map do |el| [el['start'].to_s, el['end'].to_s, el['time'].to_f]
  end
end
  def price_graph
  data.map do |el| [el['start'].to_s, el['end'].to_s, el['price'].to_f]
  end
end

  def calculate(from_station:, to_station:)
    { price: calculate_price(from_station: from_station, to_station: to_station),
      time: calculate_time(from_station: from_station, to_station: to_station) }
  end

  def calculate_price(from_station:, to_station:)
    # your implementation here
    r = price_graph

    ob = Dijkstra.new(start_pint, end_point, r)
    ob.cost
  end

  def calculate_time(from_station:, to_station:)
    # your implementation here
    r = timing_graph

ob = Dijkstra.new(start_point, end_point, r)
ob.cost
  end
