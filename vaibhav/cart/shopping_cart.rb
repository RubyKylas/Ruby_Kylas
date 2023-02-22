class Shopping_cart

    def initialize
        @ary = Array.new{{}}
        @cart = Array.new{{}}
    end

    def Add_Products(ary)
        print 'Enter product name: '
        productName = gets
        print 'enter product value: '
        productValue = gets
        print 'Enter product quantity: '
        productQuantity = gets
        @ary.push([productName, productValue, productQuantity])
    end

    def AddTo_cart(cart, ary)

        print 'Enter the product name: '
        prdName = gets
        @ary = [["apple",120,5],["orange",150,10]]
        @cart = []
      
        abc = @ary.find { |x| x[0] == prdName }
        if abc
          print 'Enter qunatity of ', prdName, ' '
          prdQuan = gets
          @cart.push([prdName, abc[1], prdQuan])
        else
          return 'enter a valid name'
        end
        return @cart
    end

    def DisplayAll(ary)
        puts "\ndisplaying all the products"
        puts ' '
        puts 'Name  Cost  Quantity'
        @ary = [["apple",120,5],["orange",150,10]]
        @ary.each do |r|
          puts r.each { |p| p }. join(' ')
        end
        return @ary
        puts ' '
    end
      
    def Display_cart(cart)
        puts "\ndisplaying your cart"
        puts ' '
        puts 'Name  Cost  Quantity'

        @cart = [["apple",120,5]]

        @cart.each do |r|
          puts r.each { |p| p }. join(' ')
        end
        puts ' '
        return @cart
    end

    def DeleteFrom_cart(cart)
        puts 'which cart item u want to delete'
        prdName = gets
        @cart = [["apple",120,5],["orange",150,10]]

        isDelete = @cart.find { |x| x[0] == prdName }
        if isDelete
          @cart.delete_if { |x, *_| x == prdName }
        else
          return 'Enter a valid Name'
        end
        return @cart
    end

    def BillAnd_referral(cart)
  
        referal = %w[abcd ababab pqrst kakakakaka]
        amount = 0
        
        puts 'Do you have any ref please enter below here'
        refName = gets

        @cart = [["apple",100,5],["orange",100,10]]

      
        if referal.include?(refName)
          for i in @cart
            amount += i[1].to_i*i[2].to_i
          end
          amount -= amount*5/100

        else
          for i in @cart
            amount += i[1].to_i*i[2].to_i
          end
        end
        
        Display_bill(amount,cart)
        return amount
    end

    def Display_bill(amount, cart)
        puts 'This is your detailed bill'
        print 'Billig is done for: '
        print "\nPhone no is: "
        print "\nThe total of your cart is: ",amount
        puts 'You have following items in your cart'
        Display_cart(cart)
        puts 'Thank you for shopping with us!!!'
    end

    def Display_menu
        puts '1. Create Inventory'
        puts '2. Add to cart'
        puts '3. Display all Products avaialble'
        puts '4. Display my cart'
        puts '5. Delete from cart'
        puts '6. Display Menu'
        puts '7. Bill and referrall code'
        puts '8. Exit'
    end
    
end

#shopping cart