class Car

  def initialize(make, model_year)
    @make = make
    @model_year = model_year
    @speed = 0
    @lights = false
    @parking_brake = true
  end

  def make
    @make
  end

  def model_year
    @model_year
  end

  def speed
    @speed
  end

  def accelerate
    @speed = @speed + 10
  end

  def brake
    if @speed <=7
      @speed = 0
    else
      @speed = @speed -7
    end
  end

  def lights
    @lights
  end

  def lights_on?
    if @lights == false
      "Lights are off"
    else
      "Lights are on"
    end
  end

  def lights_toggle
    @lights = !@lights
  end

  def parking_brake
    @parking_brake
  end

  def pb_on?
    if @parking_brake == true
      "Parking brake is on"
    elsif @parking_brake == false
      "Parking brake is off"
    end
  end

  def brake_toggle
    @parking_brake = !@parking_brake
  end

end
