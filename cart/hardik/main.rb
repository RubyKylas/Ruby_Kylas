load 'service.rb'
# INITIALIZATION
# -------------------------------------------------------
puts '-------------------------------------------------------'
puts 'WELCOME TO THE G DROP SHOPPING PLEASE ADD SOME PRODUCTS TO CONTINUE'
puts '-------------------------------------------------------'
while true
  puts '1. add the product'
  puts '2. go for shopping'
  puts '3. view inventory'
  choice = gets.chomp.to_i
  case choice
    when 1
      puts 'enter the name of the product'
      name = gets.chomp
      puts 'enter the quantity'
      quantity = gets.chomp.to_i
      puts 'enter price'
      price = gets.chomp.to_i
      product = add_product(name, quantity, price)
      $product_list.push(product)
      puts 'item added to the inventory'
    when 2
      break
    when 3
      view_inventory($product_list)
    else
      puts 'please select the valid choice'
  end
end
# -------------------------------------------------------

# GO FOR SHOPPING
# -------------------------------------------------------
while true
  puts 'please select the proper choice'
  puts '1. view product list'
  puts '2. add item to cart'
  puts '3. view cart'
  puts '4. update cart'
  puts '5. remove item from cart'
  puts '6. checkout'
  puts '7. exit'
  choice = gets.chomp.to_i
  case choice
    when 1
      view_inventory($product_list)
    when 2
      puts 'enter the id of product'
      index = gets.chomp.to_i
      puts 'enter the quantity of product'
      quantity = gets.chomp.to_i
      add_to_cart(index, quantity)
    when 3
      view_cart
    when 4
      puts 'please provide the id of the item'
      index = gets.chomp.to_i
      puts 'enter quantity'
      quantity = gets.chomp.to_i
      update_cart(index, quantity)
    when 5
      puts 'enter the id of the product'
      product_id = gets.chomp.to_i
      remove_from_cart(product_id)
    when 6
      puts 'enter percent discount'
      discount = gets.chomp.to_i
      checkout(discount)
    when 7
      return
    else
      puts 'please select the proper choice'
  end
end
# -------------------------------------------------------
