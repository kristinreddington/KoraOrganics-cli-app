require_relative '../../config/environment.rb'
require_relative './product.rb'
require_relative './cli.rb'
require 'open-uri'
require 'nokogiri'
require 'pry'


class KoraSkincare::Scraper

  def self.scrape_by_category_url(category_url)
    page = Nokogiri::HTML(open(category_url))

    page.css("div.product-item.columns.large-3").each do |product|

      new_product = KoraSkincare::Product.new
      new_product.name = product.css("div.caption a").text.split.join(' ')
      new_product.type = page.css("div.row article.description.columns h3").children[0].text
      new_product.price = product.css("p.price span.money").text
      new_product.url = "https://us.koraorganics.com" + product.css("p.title a").attribute("href").value
      
    end
  end
      #products.each do |producthash|
      #producthash.delete_if {|key, value| value == nil || value == ""}
    #end
    #products
  #end

  #description = page.css("div.row article.description.columns h3").children[1].text


end # End KoraSkincare::Scraper method
