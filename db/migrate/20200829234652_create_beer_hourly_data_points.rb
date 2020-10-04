# frozen_string_literal: true

class CreateBeerHourlyDataPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :beer_hourly_data_points do |t|
      t.references :beer, null: false, foreign_key: true
      t.decimal :temperature
      t.decimal :specific_gravity

      t.timestamps
    end
  end
end
