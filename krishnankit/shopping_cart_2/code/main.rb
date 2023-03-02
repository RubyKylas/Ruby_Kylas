require_relative "service.rb"

inventory = Inventory.new
cart = Cart.new

while 1
  menu()
  print "Your option: "
  user_input = gets.chomp.to_i
  case user_input
    when 0
      break
    when 1
      inventory.display()
    when 2
      print "Enter the name: "
      name = gets.chomp.downcase
      print "Enter the price: "
      price = gets.chomp.to_i
      print "Enter the quantity: "
      quantity = gets.chomp.to_i
      new_product = Product.new(name, price)
      inventory.add_product(new_product, quantity)
    when 3
      print "Enter the name: "
      name = gets.chomp.downcase
      print "Enter the quantity: "
      quantity = gets.chomp.to_i
      cart.add_product(name, quantity, inventory.products)
    when 4 
      cart.display()
    when 5
      print "Enter referal code: "
      code = gets.chomp
      cart.generate_bill(code)
    when 6
      print "Enter the name of product you want to delete: "
      name = gets.chomp.downcase
      cart.delete_product(name, inventory.products)
    else
      puts "Plese enter valid input."
  end
end
