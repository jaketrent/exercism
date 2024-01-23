defmodule FreelancerRates do

  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    if discount > 0 do 
      before_discount - before_discount * (discount / 100)
    else
      before_discount
    end
  end

  def monthly_rate(hourly_rate, discount) do
    22 * daily_rate(hourly_rate) |> apply_discount(discount) |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    budget / (daily_rate(hourly_rate) |> apply_discount(discount)) |> Float.floor(1)
  end
end
