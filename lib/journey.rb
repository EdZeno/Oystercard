class Journey

def initialize(station)
  @entry_station = station
  @complete = false
end

attr_reader :entry_station, :exit_station, :complete


def exit(station)
  @exit_station = station
  @complete = true
end

def fare
  if !@entry_station && @exit_station
    return 1
  else
    return 6
  end
end

end
