class Inventory
  attr_accessor  :products, :codes
  def initialize(products = [], codes = [])
    @products = products
    @codes = codes
  end

  def display()
    puts @products
  end

  def delete_item(name = nil)
    @products.delete_if {|product| product[:name] == name}
  end

  def add_item(name = nil, price = nil, quantity = nil)
    return @products if (name.nil? || quantity.nil?) 
    price  = price.to_i
    quantity = quantity.to_i
    index = @products.find_index { |p| p[:name] == name }
    if !index.nil?
      @products[index] = { name: name, price: price.to_i || 0, quantity: @products[index][:quantity] + quantity.to_i }
    else
      @products.push({ name: name, price: price.to_i || 0, quantity: quantity.to_i })
    end
    @products
  end
  
  def add_code(code = nil, discount = nil)
    discount = discount.to_i
    return @codes if (code.nil? || discount.nil?)
    index = @codes.find_index { |code| code[:code] == code }
    if !index.nil?
      @codes[index] = { code: code, discount: discount.to_i}
    else
      @codes.push({ code: code, discount: discount.to_i})
    end
    @codes
  end
end
