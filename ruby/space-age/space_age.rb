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
    mercury_orbital_period_in_earth_years * seconds_in_earth_day
  end

  def seconds_in_venus_day
    venus_orbital_period_in_earth_years * seconds_in_earth_day
  end

  def seconds_in_mars_day
    mars_orbital_period_in_earth_years * seconds_in_earth_day
  end

  def seconds_in_jupiter_day
    jupiter_orbital_period_in_earth_years * seconds_in_earth_day
  end

  def seconds_in_saturn_day
    saturn_orbital_period_in_earth_years * seconds_in_earth_day
  end

  def seconds_in_uranus_day
    uranus_orbital_period_in_earth_years * seconds_in_earth_day
  end

  def seconds_in_neptune_day
    neptune_orbital_period_in_earth_years * seconds_in_earth_day
  end

  def mercury_orbital_period_in_earth_years
    0.2408467
  end

  def venus_orbital_period_in_earth_years
    0.61519726
  end

  def mars_orbital_period_in_earth_years
    1.8808158
  end

  def jupiter_orbital_period_in_earth_years
    11.862615
  end

  def saturn_orbital_period_in_earth_years
    29.447498
  end

  def uranus_orbital_period_in_earth_years
    84.016846
  end

  def neptune_orbital_period_in_earth_years
    164.79132
  end

end