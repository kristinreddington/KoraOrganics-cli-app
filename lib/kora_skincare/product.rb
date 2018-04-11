require_relative '../../config/environment.rb'
require_relative './product.rb'
require_relative './cli.rb'
require 'pry'

class KoraSkincare::Product

  attr_accessor :type, :description, :name, :price, :url

@@all = []


  def initialize
    @@all << self
    #binding.pry
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

  def self.dry
    dry_product = @@all.select {|product| product.type == "DRY"}
    dry_product
end


  def self.sensitive
    sensitive_product = @@all.select {|product| product.type == "SENSITIVE"}
    sensitive_product
  end

  def self.oily_combination
    oily_product = @@all.select {|product| product.type == "OILY / COMBINATION"}
    oily_product
  end

  #def self.age_defying
    #@@all.collect {|product| product.type == "Age-defying"}
  #end

  def self.blemish_congested
    blemish_product = @@all.select {|product| product.type == "BLEMISH / CONGESTED"}
    blemish_product
  end



end  # End GoodGuide::Scraper Method
