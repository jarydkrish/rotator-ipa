class Post < ApplicationRecord
  belongs_to :user

  has_rich_text :content

  def reading_time
    words_per_minute = 150
    text = Nokogiri::HTML(content.body.to_html).inner_text
    (text.scan(/\w+/).length / words_per_minute).to_i
  end
end
