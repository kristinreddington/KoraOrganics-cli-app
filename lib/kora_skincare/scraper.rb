require_relative '../../config/environment.rb'
require_relative './product.rb'
require_relative './cli.rb'
require 'open-uri'
require 'nokogiri'


class KoraSkincare::Scraper

  def self.scrape_by_category_url(category_url)
    page = Nokogiri::HTML(open(category_url))
    products = []

    page.css("div.product-item.columns.large-3.has-hover").each do |product|
      #page = Nokogiri::HTML(open(category_url))

      #product_type = page.css("div.row article.description.columns h3").children[0].text
      #description = page.css("div.row article.description.columns h3").children[1].text

      product_hash = {:name => product.css("div.caption a").text.split.join(' '),
      :price => product.css("p.price span.money").text,
      :type => page.css("div.row article.description.columns h3").children[0].text,
      #:description => description,
      :url => product.css("p.title a").attribute("href").value}
      products << product_hash
    end
      products.each do |producthash|
      producthash.delete_if {|key, value| value == nil || value == ""}
    end
    products
  end


end # End KoraSkincare::Scraper method
