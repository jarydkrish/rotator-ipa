class AddHydrometerToBeerHourlyDataPoint < ActiveRecord::Migration[6.0]
  def change
    add_reference :beer_hourly_data_points, :hydrometer, null: true, foreign_key: true
  end
end
