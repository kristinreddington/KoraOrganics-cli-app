class KoraSkincare::CLI

  def initialize
    KoraSkincare::Scraper.scrape_by_category_url("https://us.koraorganics.com/collections/normal-dry")
    KoraSkincare::Scraper.scrape_by_category_url("https://us.koraorganics.com/collections/normal-sensitive")
    KoraSkincare::Scraper.scrape_by_category_url("https://us.koraorganics.com/collections/oily-combination")
    KoraSkincare::Scraper.scrape_by_category_url("https://us.koraorganics.com/collections/blemish-congested")
  end

  def call
    list_options
    main_menu
  end


  def list_options
    puts ""
    puts "🌱  Welcome to KoraSkincare! 🌱 \n\nAn application to help you find organic skincare matched by your individual skin type.\n\n"
    puts " 1. Dry \n 2. Sensitive \n 3. Oily / Combination \n 4. Blemish / Congested "
    puts ""
    puts "You can type 'list' at any time to view these options again or 'exit' to exit \nthe application."
  end

  def individual_product
    puts "Are there any listed products you would like more details on? Enter the number \nof your choice."
  end

  def invalid_choice
    puts "Please choose a number from the listed options"
  end

  def list_dry
    puts ""
    dry_list = KoraSkincare::Product.dry.each.with_index {|x, index| puts "#{index + 1}. #{x.name}"}
    puts ""
    dry_list
  end

  def list_sensitive
    puts ""
    sensitive_list = KoraSkincare::Product.sensitive.each.with_index {|x, index| puts "#{index + 1}. #{x.name}"}
    puts ""
    sensitive_list
  end

  def list_oily_combination
    puts ""
    oily_list = KoraSkincare::Product.oily_combination.each.with_index {|x, index| puts "#{index + 1}. #{x.name}"}
    puts ""
    oily_list
  end

 def list_blemish_congested
   puts ""
   blemish_list = KoraSkincare::Product.blemish_congested.each.with_index {|x, index| puts "#{index + 1}. #{x.name}"}
   puts ""
   blemish_list
 end

  def main_menu
    input = nil
    puts "Please enter the number to the category you'd like to explore based on your skin's individual needs.\n\n"
    while input != "exit"
        input = gets.strip.downcase

    if input == "1"
         puts "\nReplenish skin with products that nourish, and restore the skin's moisture levels are key.\nBe sure to give skin some extra tender loving care during the colder months when \nmoisture in the air is reduced.\n\n"
         list_dry
         individual_product
         input = gets.strip
         if input == "exit"
           break

     elsif input == "list"
        list_options

     elsif (input != '0') && (input.to_i.to_s != input.strip) || (input.to_i > KoraSkincare::Product.dry.length)
        invalid_choice
        list_dry
        input = gets.strip

      else
        #input.to_i <= KoraSkincare::Product.dry.length
        product = KoraSkincare::Product.dry[input.to_i - 1]
        name = product.name
        price = product.price
        url = product.url
        puts "\nBeautiful choice 💞 !\n\n#{name}:\n\nThis skincare product is #{price}. \n\nYou can purchase this product at: \n#{url}."
      end


      elsif input == "2"
        puts "\nSoothing products that avoid heating the skin and gently nourish are best to balance the skin's moisture levels and improve appearance.  Avoiding harsh chemicals and synthetic fragrances will often help in reviving sensitive skin."
        list_sensitive
        individual_product
        input = gets.strip

       if input == "exit"
            break

      elsif input == "list"
        list_options

      elsif input.to_i > KoraSkincare::Product.sensitive.length
        invalid_choice
        list_sensitive
        input = gets.strip

      else
        product = KoraSkincare::Product.sensitive[input.to_i - 1]
        name = product.name
        price = product.price
        url = product.url
        puts "\nBeautiful choice 💞 !\n\n#{name}:\n\nThis skincare product is #{price}. \n\nYou can purchase this product at: \n#{url}."
      end


      elsif input == "3"
        puts "\nCarefully cleansing and refining the oilier parts of the skin is required, while being mindful of maintaining the moisture levels required on the less oily areas of the face."
        list_oily_combination
        individual_product
        input = gets.strip

       if input == "exit"
        break

     elsif input == "list"
        list_options

     elsif input.to_i > KoraSkincare::Product.oily_combination.length
       invalid_choice
       list_oily_combination
       input = gets.strip

     else
      product = KoraSkincare::Product.oily_combination[input.to_i - 1]
      name = product.name
      price = product.price
      url = product.url
      puts "\nBeautiful choice 💞 !\n\n#{name}:\n\nThis skincare product is #{price}. \n\nYou can purchase this product at: \n#{url}."
    end

    elsif input == "4"
      puts "\nControl excess oil, gently exfoliate dead skin cells, rehydrate and minimize blemishes.  Remember to balance your lifestyle with healthy eating, lowering stress levels and drinking plenty of water, as these can sometimes play a role in skin conditions."
      list_blemish_congested
      individual_product
      input = gets.strip

    if input == "exit"
        break

    elsif input == "list"
      list_options

    elsif input.to_i > KoraSkincare::Product.blemish_congested.length
      invalid_choice
      list_dry
      input = gets.strip

     else
       product = KoraSkincare::Product.blemish_congested[input.to_i - 1]
       name = product.name
       price = product.price
       url = product.url
       puts "\nBeautiful choice 💞 !\n\n#{name}:\n\nThis skincare product is #{price}. \n\nYou can purchase this product at: \n#{url}."
     end

   elsif input == "exit"
     break
   elsif input == "list"
     list_options
   else
     invalid_choice

     end #end else/if
   end #end while
 end #end method
end #end KoraSkincare::CLI class
