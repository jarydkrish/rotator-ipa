# frozen_string_literal: true

# A beer that we are brewing
class Beer < ApplicationRecord
  has_many :beer_daily_data_points, dependent: :destroy
  has_many :beer_hourly_data_points, dependent: :destroy
  has_rich_text :recipe

  def started?
    Time.zone.today > start_date
  end

  def bottled?
    Time.zone.today > bottle_date
  end

  def brewed?
    Time.zone.today > ready_date
  end

  def time_after_start_before_bottle
    return 0 unless started?
    return bottle_date - start_date if bottled?

    Time.zone.today - start_date
  end

  def time_until_bottle
    return 0 unless started? && !bottled?

    bottle_date - Time.zone.today
  end

  def time_after_bottle_before_ready
    return 0 unless bottled?
    return bottle_date - start_date if !bottled? || brewed?

    Time.zone.today - bottle_date
  end

  def time_until_ready
    return 0 unless started? && !brewed?
    return ready_date - bottle_date if started? && !bottled?

    ready_date - Time.zone.today
  end
end
