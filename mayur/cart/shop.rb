class Shop

  attr_reader :products, :codes

  def initialize(products = {}, codes = {})
    @cart = {}
    @products = products
    @codes = codes
  end

  def update_inventory(products, codes)
    @products = products
    @codes = codes
  end

  def display()
    puts @cart
  end

  def add_to_cart(name = nil,need = nil)
    need = need.to_i
    return @cart if (name.nil? || need.nil?)
    index = @products.find_index { |p| p[:name] == name }
    if !index.nil?
      product = @products[index]
      return @cart if need <= 0
      if need > product[:quantity]
        need = product[:quantity]
        @products.delete_at(index)
      else
        @products.map! do |x|
          x[:quantity] - need if x[:name] == name
        end
      end
      item = @cart.find{ |item_name, item_data|
        name == item_name
      }
      if(item)
        @cart[name][1] += need
      else
        @cart[name] = [product[:price], need]
      end
      @cart
    else
      @cart
    end
    @cart
  end

  def checkout(code = nil)
    total = 0
    @cart.each do |name, data|
      puts "#{name} : #{data[0]} : #{data[1]}"
      total += data[0] * data[1]
      puts total
    end
    if code
      apply_code = @codes.find do |x|
        x[:code] == code
      end
      total -= total * apply_code[:discount] / 100 if apply_code
    end
    total
  end
end
