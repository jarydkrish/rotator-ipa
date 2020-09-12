# frozen_string_literal: true

# A beer that we are brewing
class Beer < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :beer_daily_data_points, dependent: :destroy
  has_many :beer_hourly_data_points, dependent: :destroy
  has_rich_text :recipe

  def hourly_chart_data
    beer_hourly_data_points.map do |data_point|
      {
        'time': data_point.created_at,
        'temperature': data_point.temperature,
        'specific_gravity': data_point.specific_gravity
      }
    end
  end

  def most_recent_daily_data_point
    @most_recent_daily_data_point ||= beer_daily_data_points.last
  end

  def most_recent_daily_avg_temperature
    temp = most_recent_daily_data_point&.avg_temperature
    temp ? "#{temp.round(2)} °F" : 'N/A'
  end

  def most_recent_daily_avg_specific_gravity
    gravity = most_recent_daily_data_point&.avg_specific_gravity
    gravity ? gravity.round(2).to_s : 'N/A'
  end

  def earliest_daily_data_point
    @earliest_daily_data_point ||= beer_daily_data_points.first
  end

  def earliest_daily_avg_temperature
    temp = earliest_daily_data_point&.avg_temperature
    temp ? "#{temp.round(2)} °F" : 'N/A'
  end

  def earliest_daily_avg_specific_gravity
    gravity = earliest_daily_data_point&.avg_specific_gravity
    gravity ? gravity.round(2).to_s : 'N/A'
  end

  def current_alcohol_content
    return 0 unless beer_daily_data_points.size.positive?
    return 0 if most_recent_daily_data_point == earliest_daily_data_point

    gravity_diff = earliest_daily_data_point.avg_specific_gravity - most_recent_daily_data_point.avg_specific_gravity
    gravity_diff * 131.25
  end

  def started?
    return false unless start_date

    Time.zone.today > start_date
  end

  def bottled?
    return false unless bottle_date

    Time.zone.today > bottle_date
  end

  def brewed?
    return false unless ready_date

    Time.zone.today > ready_date
  end

  def time_after_start_before_bottle
    return 0 unless started?
    return bottle_date - start_date if bottled?

    Time.zone.today - start_date
  end

  def time_until_bottle
    return bottle_date - start_date unless started?
    return 0 if bottled?

    bottle_date - Time.zone.today
  end

  def time_after_bottle_before_ready
    return 0 unless bottled?
    return bottle_date - start_date if !bottled? || brewed?

    Time.zone.today - bottle_date
  end

  def time_until_ready
    return ready_date - bottle_date unless bottled?
    return 0 if brewed?

    ready_date - Time.zone.today
  end
end
