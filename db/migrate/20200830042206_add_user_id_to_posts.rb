# frozen_string_literal: true

class AddUserIdToPosts < ActiveRecord::Migration[6.0]
  def change
    # rubocop:disable Rails/NotNullColumn
    add_reference :posts, :user, null: false, foreign_key: true
    # rubocop:enable Rails/NotNullColumn
  end
end
