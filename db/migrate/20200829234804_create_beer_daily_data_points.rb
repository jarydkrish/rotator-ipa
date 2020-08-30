class CreateBeerDailyDataPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :beer_daily_data_points do |t|
      t.references :beer, null: false, foreign_key: true
      t.date :date
      t.decimal :min_temperature
      t.decimal :max_temperature
      t.decimal :avg_temperature
      t.decimal :max_specific_gravity
      t.decimal :min_specific_gravity
      t.decimal :avg_specific_gravity

      t.timestamps
    end
  end
end
