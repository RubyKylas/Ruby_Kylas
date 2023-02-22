class Shop_cart
    attr_accessor :stock, :cart
    def initialize()
        @stock = {}
        @cart = {}
    end

    def add_product_to_stock
        print "\nEnter the name of the product: "
        name = gets.chomp.strip
    
        print "\nEnter the description of the product: "
        description = gets.chomp
    
        print "\nEnter the price of the product: "
        price = gets.chomp.to_f
    
        print "\nEnter the quantity of the product: "
        quantity = gets.chomp.to_i
    
        @stock[name] = {
            description: description,
            price: price,
            quantity: quantity
        }
    
        print "\nProduct '#{name}' has successfully added"
    end
    
    def list_all_products

        if @stock.empty?
            puts "\nStock is empty"
            return
        end
        print"\n\n---------- LIST OF ALL PRODUCTS ------------\n\n"
        @stock.each do |name, item|
            puts "Product: #{name}"
            puts "Description: #{item[:description]}"
            puts "Quantity: #{item[:quantity]}"
            puts "Price: #{item[:price]}\n\n"
        end
    end
    
    def add_product_to_cart
        print "\nEnter the name of the product to add to cart: "
        name = gets.chomp.strip
    
        if @stock.key?(name)
            item = @stock[name]
    
            print "\nEnter the quantity to add to cart: "
            quantity = gets.chomp.to_i
    
            if quantity <= item[:quantity]
                if @cart.key?(name)
                    @cart[name][:quantity] += quantity
                else
                    @cart[name] = {
                        description: item[:description],
                        price: item[:price],
                        quantity: quantity
                    }
                end
    
                item[:quantity] -= quantity
    
                puts "\n\nProduct '#{name}' has successfully added to cart"
            else
                puts "\n\nSorry! We don't have enough stocks of Product '#{name}'"
            end
        else
            puts "\n\nWe don't have Product '#{name}' in our stocks"
        end
    end

    def has_any_offer?(amount)
        if amount < 100000
            puts "\nYou are not eligible for any discount"
        elsif amount >= 100000 and amount < 300000
            puts "\nHurrah! You are eligible for 10% discount"
            amount -= amount*0.1
        elsif amount >= 300000 and amount < 500000 
            puts "\nHurrah! You are eligible for 20% discount"
            amount -= amount*0.2
        elsif amount >= 500000
            puts "\nHurrah! You are eligible for 30% discount"
            amount -= amount*0.3
        end
        puts "\n\nFinal Total: #{amount}"
    end

    def generate_bill

        if @cart.empty?
            puts "\nCart is empty"
            return
        end

        total_cost = 0
        puts "---------------- BILL -----------------"
        @cart.each do |name, item|
            total_item_cost = item[:price] * item[:quantity]
            total_cost += total_item_cost
    
            puts "\n#{name} - #{item[:quantity]} x #{item[:price]} = #{total_item_cost}"
        end
        puts "\n\nTotal: #{total_cost}"
        puts "\n--------------- OFFERS -------------------------"
        puts "\nFlat 10% discount on minimum billing Rs. 100000"
        puts "\nFlat 20% discount on minimum billing Rs. 300000"
        puts "\nFlat 30% discount on minimum billing Rs. 500000"
        puts "\n------------------------------------------------"
        has_any_offer?(total_cost)
    end
    
    def main
        loop do
            puts "\n-----------------------------------------------------"
            puts "Select an option:"
            puts "1. Add new product to stock"
            puts "2. Display stock"
            puts "3. Add product to cart"
            puts "4. Generate bill"
            puts "5. Exit"
        
            option = gets.chomp.to_i
        
            if option == 1
                add_product_to_stock
            elsif option == 2
                list_all_products
            elsif option == 3
                add_product_to_cart
            elsif option == 4
                generate_bill
            elsif option == 5
                break
            else
                puts "This option is invalid"
            end
        end
    end
end

# bill = Shop_cart.new.main

