# frozen_string_literal: true

base_url = "https://#{request.host}"
xml.instruct! :xml, version: '1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.url do |xml|
    xml.loc(base_url)
    xml.changefreq('weekly')
    xml.priority(1.0)
  end
  xml.url do |xml|
    xml.loc("#{base_url}/posts")
    xml.changefreq('daily')
    xml.priority(1.0)
  end
  xml.url do |xml|
    xml.loc("#{base_url}/beers")
    xml.changefreq('daily')
    xml.priority(1.0)
  end
  @posts.each do |post|
    xml.url do |xml|
      xml.loc("#{base_url}/posts/#{post.friendly_id}")
      xml.lastmod(post.updated_at.strftime('%F'))
      xml.changefreq('daily')
      xml.priority(0.5)
    end
  end
  @beers.each do |beer|
    xml.url do |xml|
      xml.loc("#{base_url}/beers/#{beer.friendly_id}")
      xml.lastmod(beer.updated_at.strftime('%F'))
      xml.changefreq('daily')
      xml.priority(0.5)
    end
  end
end
