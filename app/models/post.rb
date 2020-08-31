# frozen_string_literal: true

# Blog posts
class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user

  has_rich_text :content

  def reading_time
    words_per_minute = 150
    text = Nokogiri::HTML(content.body.to_html).inner_text
    minutes = (text.scan(/\w+/).length / words_per_minute).to_i
    minutes.positive? ? minutes : 1
  end
end
