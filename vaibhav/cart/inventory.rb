#shopping cart 
class Inventory

    @@ary = Array.new{{}}
    @@cart = Array.new{{}}
    
    def Add_Products(ary)
        print 'Enter product name: '
        productName = gets
        print 'enter product value: '
        productValue = gets
        print 'Enter product quantity: '
        productQuantity = gets
        @@ary.push([productName, productValue, productQuantity])
    end
  
    def DisplayAll(ary)
      puts "\ndisplaying all the products"
      puts ' '
      puts 'Name  Cost  Quantity'
      @@ary = [["apple",120,5],["orange",150,10]]
      @@ary.each do |r|
        puts r.each { |p| p }. join(' ')
      end
      return @@ary
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