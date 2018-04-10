require_relative '../../config/environment.rb'
require_relative './scraper.rb'
require_relative './product.rb'
require 'pry'

class KoraSkincare::CLI

  def initialize
    KoraSkincare::Product.create_by_category("https://us.koraorganics.com/collections/normal-dry")
    KoraSkincare::Product.create_by_category("https://us.koraorganics.com/collections/normal-sensitive")
    KoraSkincare::Product.create_by_category("https://us.koraorganics.com/collections/oily-combination")
    #KoraSkincare::Product.create_by_category("https://us.koraorganics.com/collections/age-defying")
    KoraSkincare::Product.create_by_category("https://us.koraorganics.com/collections/blemish-congested")
  end

  def call
    list_options
    main_menu
  end


  def list_options
    puts ""
    puts "🌱  Welcome to KoraSkincare! 🌱 \n\nAn application to help you find organic skincare matched by your individual skin type.\n\n"
    puts " 1. Dry \n 2. Sensitive \n 3. Oily / Combination \n 4. Age-Defying \n 5. Blemish / Congested"
    puts ""
    puts "You can type 'list' at any time to view these options again or 'exit' to exit \nthe application."
  end

  def individual_product
    puts "Are there any listed products you would like more details on? Enter the number \nof your choice."
  end

  def list_dry
    puts ""
    puts KoraSkincare::Product.dry.each.with_index {|x, index| puts "#{index + 1}. #{x.name}"}
    puts ""
  end

  def list_sensitive
    puts ""
    puts KoraSkincare::Product.sensitive.each_with_index {|x, index| puts "#{index + 1}. #{x.name}"}
    puts ""
  end

  def list_oily_combination
    puts ""
    puts KoraSkincare::Product.oily_combination.each_with_index {|x, index| puts "#{index + 1}. #{x.name}"}
   puts ""
 end

 #def list_age_defying
   #puts ""
   #puts KoraSkincare::Product.age_defying.each_with_index {|x, index| puts "#{index + 1}. #{x.name}"}
   #puts ""
 #end

 def list_blemish_congested
   puts ""
   puts KoraSkincare::Product.blemish_congested.each_with_index {|x, index| puts "#{index + 1}. #{x.name}"}
   puts ""
 end

  def main_menu
    input = nil
    puts "Please enter the number to the category you'd like to explore based on your skin's individual needs.\n\n"
    while input != "exit"
    input = gets.strip.downcase
    if input == "1"
         list_dry
         individual_product
         choose_product = gets.strip.to_i

        if choose_product > KoraSkincare::Product.dry.length
          #invalid_choice
          list_dry
          choose_product = gets.strip.to_i
        else
        end

        product = KoraSkincare::Product.dry[choose_product - 1]
        name = product.name
        price = product.price
        url = product.url
        puts "\n#{name}. Beautiful choice 💞 ! \nThis skincare product is #{price}. \nYou can purchase this product at: \n#{url}."


       elsif input == "2"
          list_sensitive
          individual_product
          choose_product = gets.strip.to_i

        if choose_product > KoraSkincare::Product.sensitive.length
          #invalid_choice
          list_sensitive
          choose_product = gets.strip.to_i
        else
        end

        product = KoraSkincare::Product.sensitive[choose_product - 1]
        name = product.name
        price = product.price
        url = product.url

        puts "\n#{name}. Beautiful choice 💞 ! \nThis skincare product is #{price}. \nYou can purchase this product at: \n#{url}."



       elsif input == "3"
        list_oily_combination
        individual_product
        choose_product = gets.strip.to_i

      if choose_product > KoraSkincare::Product.oily_combination.length
        #invalid_choice
        list_sensitive
        choose_product = gets.strip.to_i
      else
      end

      product = KoraSkincare::Product.oily_combination[choose_product - 1]
      name = product.name
      price = product.price
      url = product.url

      puts "\n#{name}. Beautiful choice 💞 ! \nThis skincare product is #{price}. \nYou can purchase this product at: \n#{url}."


      #elsif input == "4"
        #list_age_defying

      elsif input == "5"
        list_blemish_congested
        individual_product
        choose_product = gets.strip.to_i

      if choose_product > KoraSkincare::Product.blemish_congested.length
        #invalid_choice
        list_sensitive
        choose_product = gets.strip.to_i
      else
      end

      product = KoraSkincare::Product.blemish_congested[choose_product - 1]
      name = product.name
      price = product.price
      url = product.url

      puts "\n#{name}. Beautiful choice 💞 ! \nThis skincare product is #{price}. \nYou can purchase this product at: \n#{url}."


      elsif input == "list"
          list_options
     else
       "Please choose from the list of options."
     end #end else/if
   end #end while
 end #end method
end #end KoraSkincare::CLI class
