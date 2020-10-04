# frozen_string_literal: true

class CreateHydrometers < ActiveRecord::Migration[6.0]
  def change
    create_table :hydrometers do |t|
      t.string :name

      t.timestamps
    end
  end
end
