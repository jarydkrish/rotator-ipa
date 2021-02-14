# frozen_string_literal: true

class CreateCarboys < ActiveRecord::Migration[6.1]
  def change
    create_table :carboys do |t|
      t.references :beer, null: false, foreign_key: true
      t.references :hydrometer, null: false, foreign_key: true

      t.timestamps
    end

    add_reference :beer_hourly_data_points, :carboy, null: true, foreign_key: true
  end
end
