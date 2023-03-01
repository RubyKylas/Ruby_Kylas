#shopping cart 
class Inventory
  
  @@ary = Array.new{{}}
  @@cart = Array.new{{}}
  
  def Add_Products(ary)

    print 'Enter product name: '
    productName = gets
    @givenArray = [["orange",120,5]]

    if @givenArray.find { |x| x[0] == productName }
      puts 'You cant use same name as previous product'
      return 'product exist'
    else
      print 'enter product value: '
      productValue = gets
      print 'Enter product quantity: '
      productQuantity = gets
      @@ary.push([productName, productValue, productQuantity])
    end
  end

  def DisplayAll(ary)
    puts '\ndisplaying all the products'
    puts ' '
    @@ary = [["apple",120,5], ["orange",150,10]]

    if @@ary.empty?
      return 'inventory is empty'
    else
      puts 'Name  Cost  Quantity'
      @@ary.each do |r|
        puts r.each { |p| p }. join(' ')
      end
      return @@ary
    end
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