# rubocop:disable Metrics/MethodLength
# shopping cart
class Inventory
  
  @@ary = Array.new { {} }
  @@cart = Array.new { {} }
  
  def add_products(_ary)

    print 'Enter product name: '
    product_name = gets
    @given_array = [['orange', 120, 5]]

    if @given_array.find { |x| x[0] == product_name }
      puts 'You cant use same name as previous product'
      'product exist'
    else
      print 'enter product value: '
      product_value = gets
      print 'Enter product quantity: '
      product_quantity = gets
      @@ary.push([product_name, product_value, product_quantity])
    end
  end

  def display_all(_ary)
    puts '\ndisplaying all the products'
    puts ' '
    @@ary = [['apple', 120, 5], ['orange', 150, 10]]

    if @@ary.empty?
      'inventory is empty'
    else
      puts 'Name  Cost  Quantity'
      @@ary.each do |r|
        puts r.each { |p| }.join(' ')
      end
      @@ary
    end
  end

  def display_menu
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
  
# shopping cart
