defmodule FreelancerRates do
  @daily_times 8.0
  @monthly_billable_days 22

  def daily_rate(hourly_rate) do
    @daily_times * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount * 0.01)
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate
    |> apply_discount(discount)
    |> Kernel.*(@monthly_billable_days)
    |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate_with_discount = hourly_rate
                               |> daily_rate
                               |> apply_discount(discount)

    budget / daily_rate_with_discount
    |> Float.floor(1)
  end
end
