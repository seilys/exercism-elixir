defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    applied_discount = apply_discount(22 * daily_rate(hourly_rate), discount)
    trunc(Float.ceil(applied_discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_price_with_discount = apply_discount(daily_rate(hourly_rate), discount)
    final_price = budget / daily_price_with_discount
    Float.floor(final_price, 1)
  end
end
