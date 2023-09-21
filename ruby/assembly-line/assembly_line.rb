class AssemblyLine
  attr_reader :rate_per_hour

  def initialize(speed)
    raise ArgumentError, 'Num not permit' unless speed.between?(1, 10)

    @speed = speed
    car_produced_each_hour = 221
    @rate_per_hour = (@speed * car_produced_each_hour)
  end

  def production_rate_per_hour
    rate_per_hour * succes_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end

  def succes_rate
    case @speed
    when (1..4)
      1
    when (5..8)
      0.90
    when 9
      0.80
    when 10
      0.77
    end
  end
end

if $PROGRAM_NAME == __FILE__
  puts AssemblyLine.new(1).production_rate_per_hour
  puts AssemblyLine.new(11).working_items_per_minute
end
