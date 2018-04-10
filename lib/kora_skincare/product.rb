require_relative '../../config/environment.rb'
require_relative './product.rb'
require_relative './cli.rb'
require 'pry'

class KoraSkincare::Product

  attr_accessor :type, :description, :name, :price, :url

@@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

  def self.create_by_category(category_url)
    KoraSkincare::Scraper.scrape_by_category_url(category_url).each do |product_array|
    self.new
  end
end

  def self.dry
    dry_product = @@all.select {|product| product.type == "DRY"}
    #@@all.reject {|product| product.type != "DRY"}

     #do i need to gsub white space to match this string?
     dry_product
  end

  def self.sensitive
    @@all.reject {|product| product.type != "SENSITIVE"}
  end

  def self.oily_combination
    @@all.reject {|product| product.type != "OILY / COMBINATION"}
  end

  #def self.age_defying
    #@@all.collect {|product| product.type == "Age-defying"}
  #end

  def self.blemish_congested
    @@all.reject {|product| product.type != "BLEMISH / CONGESTED"}
  end



end  # End GoodGuide::Scraper Method
