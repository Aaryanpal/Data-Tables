namespace :flipkart do

    task scrap_the_product: :environment do
        puts 'HERE'

        require 'open-uri'
        require 'nokogiri'
        URL = 'https://www.flipkart.com/search?q=smart%20phones&otracker=search&otracker1=search&marketplace=FLIPKART&as-show=on&as=off'
      
        doc = Nokogiri::HTML(open(URL))
      
        index = doc.search('div._2kHMtA')
        
    index.each do |p|
          name = p.search('div._4rR01T').text
          current_price = p.search('div._25b18c').children[0].children.text
          actual_price = p.search('div._25b18c').children[1].children.text
          discount = p.search('div._25b18c').children[2].children.text
          rating =   p.search('div._3LWZlK').children.text
          # skip persisting job if it already exists in db
          if Employee.where(name:name, position:current_price, office:actual_price, age:discount, start_date:rating ).count <= 0
            Employee.create(name:name, position:current_price, office:actual_price, age:discount, start_date:rating )
            puts 'Added: ' + (name ? name : '')
          else
            puts 'Skipped: ' + (name ? name : '')
          end
      
        end 
    end
end