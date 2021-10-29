defmodule Lasagna do
  @expected_minutes_in_oven 40
  @preparation_time 2

  def expected_minutes_in_oven, do: @expected_minutes_in_oven

  def remaining_minutes_in_oven(minutes) do
    ret = expected_minutes_in_oven() - minutes
    if ret < 0, do: 0, else: ret
  end


  def preparation_time_in_minutes(number) do
    number * @preparation_time
  end

  def total_time_in_minutes(number, minutes) do
    preparation_time_in_minutes(number) + minutes
  end

  def alarm, do: "Ding!"
end
