class KoraSkincare::Product
  attr_accessor :type, :description, :name, :price, :url

@@all = []

  def initialize(producthash)
    producthash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

  def self.create_by_category(category_url)
    KoraSkincare::Scraper.scrape_by_category_url(category_url).each do |producthash|
    self.new(producthash)
  end

  def self.dry
    @@all.reject {|product| product.type != "Dry"}
  end

  def self.sensitive
    @@all.reject {|product| product.type != "Sensitive"}
  end

  def self.oily_combination
    @@all.reject {|product| product.type != "Oily / Combination"}
  end

  def self.age_defying
    @@all.reject {|product| product.type != "Age-defying"}
  end

  def self.blemish_congested
    @@all.reject {|product| product.type != "Blemish / Congested"}
  end


end
end  # End GoodGuide::Scraper Method
