def display_products(products)
  products.each do |x|
    print "Name: "
    puts x[0]
    print "Price: "
    puts x[1]
  end
end

def add_product(products, name, price)
  products.push([name, price])
  return products
end

def add_to_cart(products, cart, name, quantity)
  prod = products.find {|x| x[0] == name}
  if prod
    cart.push([name, prod[1], quantity])
  end
  return cart
end

def display_cart(cart)
  cart.each do |x|
    print "Name: "
    puts x[0]
    print "Price: "
    puts x[1]
    print "Quantity: "
    puts x[2]
  end
end

def generate_bill(cart, code)
  price = 0
  discount = 0
  cart.each do |x|
    price  = price + (x[1] * x[2])
  end
  case code
    when "FIRST"
      discount = 0.2
      puts "You got 20% discount!"
    when "COPN"
      discount = 0.1
      puts "You got 10% discount!"
    when ""
      discount = 0
      puts "You got no discount!"
    else
      discount = 0
      puts "Wrong coupon code no discount."
  end
  amount = price - (price * discount)
  print "Your total price is: "
  puts price
  print "Payable amount is: "
  puts amount.to_i
end

def delete_from_cart(cart, name)
  cart.delete_if {|x| x[0] == name}
  puts "Product deleted successfully."
  return cart
end

def display_menu
  puts "\n\nPlease select an option to do corresponding operation."
  puts "0. Exit"
  puts "1. Display products"
  puts "2. Add products"
  puts "3. Add to cart"
  puts "4. Display cart"
  puts "5. Generate Bill."
  puts "6. Delete product from cart."
end


