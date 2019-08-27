class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = -3 # tests cannot handle posirive limits, needs to be 0 or negative
  MINIMUM_AMOUNT_TO_TOUCH_IN = 1

  attr_reader :balance
  attr_reader :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    over_limit?(amount)
    @balance += amount
  end

  def deduct(amount)
    below_min_limit?(amount)
    @balance -= amount
  end

  def touch_in
    sufficient_balance_to_touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    return @in_journey
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

end
