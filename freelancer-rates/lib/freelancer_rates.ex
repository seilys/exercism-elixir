defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    # Please implement the daily_rate/1 function
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    # Please implement the apply_discount/2 function
    before_discount * (1 - discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    # Please implement the monthly_rate/2 function
    dailyRate = FreelancerRates.daily_rate(hourly_rate)
    appliedDiscount = FreelancerRates.apply_discount(22 * dailyRate, discount)
    trunc(Float.ceil(appliedDiscount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # Please implement the days_in_budget/3 function
    dailyPriceWithDiscount = apply_discount(daily_rate(hourly_rate), discount)
    finalPrice = budget / dailyPriceWithDiscount
    Float.floor(finalPrice, 1)
  end
end
