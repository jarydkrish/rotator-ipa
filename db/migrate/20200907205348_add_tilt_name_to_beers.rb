class AddTiltNameToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :tilt_name, :string
  end
end
