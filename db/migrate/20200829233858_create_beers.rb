class CreateBeers < ActiveRecord::Migration[6.0]
  def change
    create_table :beers do |t|
      t.date :start_date
      t.date :bottle_date
      t.date :ready_date
      t.string :name
      t.string :kind

      t.timestamps
    end
  end
end
