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


end # End KoraSkincare::Scraper method
