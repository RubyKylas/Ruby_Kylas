class Product 
  attr_accessor :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
end

class Inventory
  attr_accessor :products

  def initialize()
    @products = Array.new
  end

  def add_product(new_product, quantity)
    @products.push([new_product, quantity])
    return @products
  end

  def display()
    @products.each do |p|
      puts "Name: #{p[0].name}."
      puts "Price: #{p[0].price}."
      puts "Quantity: #{p[1]}."
    end
  end
end

class Cart
  attr_accessor :products
  def initialize()
    @products = []
  end

  def add_product(name, quantity, products)
    product = products.find{|p| p[0].name == name}
    if (!product)
      puts "Product is not available."     
    elsif (product[1] < quantity)
      puts "Product not availabe in sufficient quantity." 
    else
      new_product = [product[0], quantity]
      @products.push(new_product)
      product[1] -= quantity
    end
    return @products
  end

  def delete_product(name, products)
    product = @products.find{|p| p[0].name == name}
    if (!product)
      puts "Product not found in cart."
    else
      products.each do |p|
        if (p[0].name == name)
          p[1] += product[1]
        end
      end
      @products.delete_if{|p| p[0].name == name}
      puts "Product deleted successfully."
    end
    return @products
  end

  def display()
    @products.each do |p|
        puts "Name: #{p[0].name}."
        puts "Price: #{p[0].price}."
        puts "Quantity: #{p[1]}."
    end    
  end

  def generate_bill(code)
    @price = 0
    @discount = 0
    @products.each do |p|
      @price += p[0].price * p[1]
    end    

    case (code)
    when "FIRST"
      puts "You got 20% discount!"
      @discount = 0.2
    when "COUPN"
      puts "You got 10% discount!"
      @discount = 0.1
    else
      puts "You got no discount."
      @discount = 0
    end

    puts "Total price: #{@price}"
    puts "Amount payable is: #{(@price - (@price * @discount)).to_i}"
  end
end

def menu
  puts "\n\nPlease select an option to do corresponding operation."
  puts "0. Exit"
  puts "1. Display products"
  puts "2. Add products"
  puts "3. Add to cart"
  puts "4. Display cart"
  puts "5. Generate Bill."
  puts "6. Delete product from cart."
end
