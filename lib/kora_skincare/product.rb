require_relative '../../config/environment.rb'
require_relative './product.rb'
require_relative './cli.rb'

class KoraSkincare::Product

  attr_accessor :type, :description, :name, :price, :url

@@all = []

  def initialize(product_hash)
    #producthash.each {|key, value| self.send(("#{key}="), value)}
    @type = product_hash[:type] 
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

  def self.create_by_category(category_url)
    KoraSkincare::Scraper.scrape_by_category_url(category_url).each do |product_hash|
    self.new(product_hash)
  end

  def self.dry
    @@all.collect {|product| product.type == "Dry"}
  end

  def self.sensitive
    @@all.collect {|product| product.type == "Sensitive"}
  end

  def self.oily_combination
    @@all.collect {|product| product.type == "Oily / Combination"}
  end

  def self.age_defying
    @@all.collect {|product| product.type == "Age-defying"}
  end

  def self.blemish_congested
    @@all.collect {|product| product.type == "Blemish / Congested"}
  end


end
end  # End GoodGuide::Scraper Method
