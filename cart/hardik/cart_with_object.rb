# Shopping Cart Class
class Cart
  # Constructor set at default position
  # ------------------------------------------
  def initialize
    @products = Array.new(0)
    @cart_item = Array.new(0)
  end
  # ------------------------------------------

  # add product for shopping
  # ------------------------------------------
  def add_product
    print "Enter the name of product:\t"
    name = gets.chomp
    print "Enter the quantity of product:\t"
    quantity = gets.chomp.to_i
    print "Enter the price of product:\t"
    price = gets.chomp.to_i
    @products.push({ 'name' => name, 'quantity' => quantity, 'price' => price})
  end
  # ------------------------------------------

  # update product
  # ------------------------------------------
  def update_product
    puts 'Enter id of product'
    id = gets.chomp.to_i
    print "Enter name of product:\t"
    name = gets.chomp
    print "Enter quantity of product:\t"
    quantity = gets.chomp
    print "Enter price of product:\t"
    price = gets.chomp
    @products[id] = { 'name' => name, 'quantity' => quantity, 'price' => price }
  end
  # ------------------------------------------

  # view cart
  # ------------------------------------------
  def view_product
    puts "Id \t Name \t Quantity \t Price"
    puts '------------------------------------------'
    @products.each_with_index do |item,index|
      puts "#{index} \t #{item['name']} \t #{item['quantity']} \t\t #{item['price']}"
    end
    puts '------------------------------------------'
  end
  # ------------------------------------------

  # add item to cart
  # ------------------------------------------
  def add_to_cart
    view_product
    print "enter product id: \t"
    id = gets.chomp.to_i
    print "enter quantity: \t"
    quantity = gets.chomp.to_i
    check_item = @products.at(id)
    if check_item && check_item['quantity'] >= quantity
      @products[id]['quantity'] = @products[id]['quantity'] - quantity
      @cart_item.push({
        'id' => id,
        'quantity' => quantity,
        'name' => check_item['name'],
        'price' => (check_item['price'] * quantity)
      })
    else
      puts 'invalid product or quantity'
    end
  end
  # ------------------------------------------

  # remove item from cart
  # ------------------------------------------
  def remove_from_cart
    view_cart
    print "insert product id:\t"
    id = gets.chomp.to_i
    @cart_item.delete_at(id)
    view_cart
  end
  # ------------------------------------------

  # View cart item
  # ------------------------------------------
  def view_cart
    puts "Id \t Name \t Quantity \t Price"
    puts '------------------------------------------'
    @cart_item.each_with_index do |item,index|
      puts "#{index} \t #{item['name']} \t #{item['quantity']} \t\t #{item['price']}"
    end
    puts '------------------------------------------'
  end
  # ------------------------------------------

  # checkout
  # ------------------------------------------
  def checkout
    view_cart
    puts 'Enter %disount'
    discount = gets.chomp.to_i
    total = 0
    @cart_item.each do |product_item|
      total = product_item['price'] + total
    end
    total -= 0.01 * discount * total
    puts "total bill #{total}"
  end
  # ------------------------------------------
end

cart = Cart.new
puts 'welcome to the store'
# options
while true
  puts '-----------------------------------'
  puts 'please select your choice'
  puts '1. add product'
  puts '2. update product'
  puts '3. view product'
  puts '4. add item to cart'
  puts '5. remove item from cart'
  puts '6. view cart'
  puts '7. checkout'
  puts '8. exit'
  puts '-----------------------------------'
  choice = gets.chomp
  case choice
  when '1'
    cart.add_product
  when '2'
    cart.update_product
  when '3'
    cart.view_product
  when '4'
    cart.add_to_cart
  when '5'
    cart.remove_from_cart
  when '6'
    cart.view_cart
  when '7'
    cart.checkout
  when '8'
    return
  else
    puts 'invalid choice please try again'
  end
end
