class KoraSkincare::Scraper

  def self.scrape_by_category_url(category_url)
    page = Nokogiri::HTML(open(category_url))
    products = []

    page.css("div.product-item.columns.large-3.has-hover").each do |product|

      product_type = product.css("article.description h3").first
      description = product.css("article.description h3")[1]

       product_hash = {:type => product_type,
      :description => description,
      :name => product.css("div.caption a").text.split.join(' '),
      :price => product.css("p.price span.money").text,
      :url => product.css("p.title a").attribute("href").value}
      products << product_hash
    end
      products.each do |producthash|
      producthash.delete_if {|key, value| value == nil || value == ""}
    end
    products
  end


end # End KoraSkincare::Scraper method
