class Menu 
  attr_accessor :menu
  def initialize
    @menu = {"Apple" => {:price => 200, :quantity => 20}, "Mobile" => {:price => 20000, :quantity => 35}, "Watch" => {:price => 3999, :quantity => 15}}
  end

  def add_to_menu(item_name, item_price, item_quantity)
      @menu[item_name] = { price: item_price, quantity: item_quantity }
      puts "#{item_name} added to menu: "
  end

  def print_menu()
    puts "Name | Price | Quantity"
    @menu.each do |key, value|
      print "#{key} "
      value.each do |_key1, value1|
        print "   #{value1}   "
      end
      puts
    end
  end
end 

m1 = Menu.new

class Cart 
  attr_accessor :cart
  attr_accessor :m1
  def initialize(m)
    @cart = {"Apple" => {:price => 200, :quantity => 10}}
    @menu_object = m
  end

  def add_to_cart(item_name, item_quantity)
    if @menu_object.menu[item_name]
      if @menu_object.menu[item_name][:quantity] >= item_quantity
        item_price = @menu_object.menu[item_name][:price]
        @cart[item_name] = { price: item_price, quantity: item_quantity }
        @menu_object.menu[item_name][:quantity] -= item_quantity
        puts "#{item_name} added to cart: "
      else
        puts "We only have #{@menu_object.menu[item_name][:quantity]} items of #{item_name} in menu."
      end 
    else
      puts "We do not have #{item_name} item in menu."
    end
  end

  def print_cart()
    puts "Name | Price | Quantity"
    @cart.each do |key, value|
      print "#{key} "
      value.each do |_key1, value1|
        print "   #{value1}   "
      end
      puts
    end
  end

  def remove_from_cart(item_name, item_quantity)
    if @cart[item_name] 
      if @cart[item_name][:quantity] >= item_quantity
        @cart[item_name][:quantity] -= item_quantity
        @menu_object.menu[item_name][:quantity] += item_quantity
        if @cart[item_name][:quantity] == 0
          @cart.delete(item_name)
          puts "#{item_name} removed from cart."
        end
        puts "#{item_quantity} items of #{item_name} removed from cart."
      else
        puts "You have only #{@cart[item_name][:quantity]} items in your cart."
      end
    else
      puts "You do not have #{item_name} in your cart."
    end 
  end 

  def make_bill(cart)
    gross_amount = calculate_gross_bill
    gst_amount = calculate_gst(gross_amount)
    discount_amount = calulate_discount(gross_amount)
    total_amount = gross_amount + gst_amount - discount_amount
    puts "Your total amount is: #{total_amount}"
  end

  def calculate_gst(amount)
    gst_amount = 0.0
    s_gst = 8
    c_gst = 8
    gst_amount = (amount / 100) * (c_gst + s_gst)
    puts "Your GST amount is #{gst_amount}"
    gst_amount
  end

  def calulate_discount(amount)
    puts 'We have 10%, 20% and 30% discount based on your bill'
    discount_amount = 0.0
    if amount > 300
      discount_amount =  amount * 0.3
    elsif amount > 200
      discount_amount =  amount * 0.2
    elsif amount > 100
      discount_amount =  amount * 0.1
    else
      discount_amount = amount * 0.05
    end
    puts "Your discount amount is: #{discount_amount}"
    discount_amount
  end
  
  def calculate_gross_bill
    gross_amount = 0.0
    @cart.each do |_key, value|
      gross_amount += (value[:price] * value[:quantity])
    end
    puts "Your gross amount is #{gross_amount}"
    gross_amount
  end
end 

c1 = Cart.new(m1)

loop do
  puts
  puts '--------Welcome to shopping cart--------'
  puts
  puts 'Press -1 to exit'
  puts '1. Add item in menu'
  puts '2. Print menu'
  puts '3. Add item to your cart'
  puts '4. Print your cart'
  puts '5. Remove item from cart'
  puts '6. Make bill'
  puts
  print "Enter your choice: "
  option = gets.chomp.to_i
  
  if option == -1
    break

  elsif option == 1    
    print 'Enter item name : '
    item_name = gets.chomp
    print 'Enter price: '
    item_price = gets.chomp.to_i    
    print 'Enter quantity: '
    item_quantity = gets.chomp.to_i
    m1.add_to_menu(item_name, item_price, item_quantity)

  elsif option == 2
    m1.print_menu()

  elsif option == 3
    print 'Enter item name : '
    item_name = gets.chomp
    print 'Enter quantity: '
    item_quantity = gets.chomp.to_i
    c1.add_to_cart(item_name, item_quantity)

  elsif option == 4
    c1.print_cart()
    
  elsif option == 5
    print 'Enter item name : '
    item_name = gets.chomp
    print 'Enter quantity: '
    item_quantity = gets.chomp.to_i
    c1.remove_from_cart(item_name, item_quantity)

  elsif option == 6
    c1.make_bill(c1.cart)

  else
    puts "Invalid choice"
  end
end
