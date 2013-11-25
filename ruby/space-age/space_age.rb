class SpaceAge

  def initialize(seconds)
    @seconds = seconds
  end

  def seconds
    @seconds
  end

  def on_earth
    (@seconds / seconds_in_earth_day).round(2)
  end

  def on_mercury
    (@seconds / seconds_in_mercury_day).round(2)
  end

  def on_venus
    (@seconds / seconds_in_venus_day).round(2)
  end

  def on_mars
    (@seconds / seconds_in_mars_day).round(2)
  end

  def on_jupiter
    (@seconds / seconds_in_jupiter_day).round(2)
  end

  def on_saturn
    (@seconds / seconds_in_saturn_day).round(2)
  end

  def on_uranus
    (@seconds / seconds_in_uranus_day).round(2)
  end

  def on_neptune
    (@seconds / seconds_in_neptune_day).round(2)
  end

  private

  def seconds_in_earth_day
    (365.25 * 60 * 60 * 24).to_f
  end

  def seconds_in_mercury_day
    0.2408467 * seconds_in_earth_day
  end

  def seconds_in_venus_day
    0.61519726 * seconds_in_earth_day
  end

  def seconds_in_mars_day
    1.8808158 * seconds_in_earth_day
  end

  def seconds_in_jupiter_day
    11.862615 * seconds_in_earth_day
  end

  def seconds_in_saturn_day
    29.447498 * seconds_in_earth_day
  end

  def seconds_in_uranus_day
    84.016846 * seconds_in_earth_day
  end

  def seconds_in_neptune_day
    164.79132 * seconds_in_earth_day
  end

end