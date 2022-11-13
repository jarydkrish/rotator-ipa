# frozen_string_literal: true

# Summarizes the hourly beer data for a day
class DailyBeerSummaryJob < ApplicationJob
  queue_as :default

  def perform(day = nil)
    @day = day || Time.zone.today
    hourly_data_to_summarize = BeerHourlyDataPoint.where('created_at > ?', @day - 1.day)
                                                  .where('created_at < ?', @day + 2.days)
    beers = Beer.where(id: hourly_data_to_summarize.pluck(:beer_id))
    beers.find_each do |beer|
      daily_summary(beer, @day, hourly_data_to_summarize)
    end
  end

  private

  def daily_summary(beer, day, hourly_data)
    daily_data = BeerDailyDataPoint.where(beer:, date: day).first_or_initialize
    beer_hourly_data = hourly_data.where(beer:)
    save_daily_summary_update(daily_data, beer_hourly_data)
  end

  def save_daily_summary_update(daily_data, beer_hourly_data)
    daily_data.min_temperature = beer_hourly_data.minimum(:temperature)
    daily_data.max_temperature = beer_hourly_data.maximum(:temperature)
    daily_data.avg_temperature = beer_hourly_data.average(:temperature)
    daily_data.min_specific_gravity = beer_hourly_data.minimum(:specific_gravity)
    daily_data.max_specific_gravity = beer_hourly_data.maximum(:specific_gravity)
    daily_data.avg_specific_gravity = beer_hourly_data.average(:specific_gravity)
    daily_data.save!
  end
end
