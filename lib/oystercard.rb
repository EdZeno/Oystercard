class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = -3 # tests cannot handle posirive limits, needs to be 0 or negative
  MINIMUM_AMOUNT_TO_TOUCH_IN = 1
  PENALTY_FARE = 6

  attr_reader :balance, :entry_station, :journeys

  def initialize
    @balance = 0
    @journeys = [{entry_station: 1, exit_station: 2}] # change to array?
  end


  def top_up(amount)
    over_limit?(amount)
    @balance += amount
  end

  def touch_in(station)
    p "#{@journeys[-1].keys}"
    # deduct(@journey.fare)
    # @journeys << {entry_station: station, exit_station: nil}
    # sufficient_balance_to_touch_in # move - constant might be better defined in journey?
    # deduct(MINIMUM_AMOUNT_TO_TOUCH_IN) #move?
    # @entry_station = station #move?
    # @journey = Journey.new(station)
  end

  def touch_out(station)
    if @journey == nil
      deduct(6)
    else
    @journeys << {entry_station: @entry_station , exit_station: station} #change?
    @entry_station = nil #nmove?
    @journey.exit(station)
    deduct(@journey.fare)
  end
  end

  def in_journey? #move
    if @entry_station != nil then
      return true
    else false
    end
  end

  private

  def over_limit?(amount)
    raise "You have reached your top-up limit of #{MAXIMUM_BALANCE}." if @balance + amount > MAXIMUM_BALANCE
  end

  def below_min_limit?(amount)
    raise "Failed - you attempted to go below limit of #{MINIMUM_BALANCE}." if @balance - amount < MINIMUM_BALANCE
  end

  def sufficient_balance_to_touch_in
    raise "Failed - you do not have minimunm balance of #{MINIMUM_AMOUNT_TO_TOUCH_IN}." if @balance < MINIMUM_AMOUNT_TO_TOUCH_IN
  end

  def deduct(amount)
    below_min_limit?(amount)
    @balance -= amount
  end
end
