class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.datetime :published_at
      t.boolean :published, default: false
      t.text :title
      t.text :description
      t.text :page_title
      t.text :page_description

      t.timestamps
    end
  end
end
