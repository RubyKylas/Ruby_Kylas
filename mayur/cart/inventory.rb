class Inventory
  
  attr_accessor  :products, :codes

  def initialize(products, codes)
    @products = products
    @codes = codes
  end

  def delete_item(name = nil)
    index = @products.find_index { |p| p[:name] == name }
    return nil if index.nil?
    @products.delete_at(index)
  end
  
  def add_item(name = nil,price = nil,quantity = nil)
    return nil if (name.nil? || quantity.nil?) 
    index = @products.find_index { |p| p[:name] == name }
    if !index.nil?
      @products[index] = { name: name, price: price.to_i || 0, quantity: quantity.to_i }
    else
      @products.push({ name: name, price: price.to_i || 0, quantity: quantity.to_i })
    end
    @products
  end

  def add_code(code=nil,discount=nil)
    return nil if (code.nil? || discount.nil?)
    @codes.push({ code: code, discount: discount.to_i })
  end

end
