class KoraSkincare::Product

  attr_accessor :type, :name, :price, :url

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

  def self.blemish_congested
    blemish_product = @@all.select {|product| product.type == "BLEMISH / CONGESTED"}
    blemish_product
  end


end  # End GoodGuide::Scraper Method
