class AddSlugToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :slug, :string
    add_index :beers, :slug, unique: true
  end
end
