# Cart Code Created By Hardik Jade
# VARIABLES
# -------------------------------------------------------
$product_list = []
$cart_list = []
# -------------------------------------------------------s

# INVENTORY RELATED FUNCTIONS
# -------------------------------------------------------s
def add_product(name, quantity, price)
  {'name' => name , 'quantity' => quantity, 'price' => price}

end

def view_inventory(product_list)
  puts "Id \t Name \t Quantity \t Price"
  puts '------------------------------------------'
  product_list.each_with_index do |item,index|
    puts "#{index} \t #{item['name']} \t #{item['quantity']} \t\t #{item['price']}"
  end
  puts '------------------------------------------'
  true
end
# -------------------------------------------------------s

# CART RELATED CODE
# -------------------------------------------------------s
def add_to_cart(index, quantity)
  check_item = $product_list.at(index)
  if check_item && check_item['quantity'] >= quantity
    $cart_list.push({
      'id' => index,
      'name' => check_item['name'],
      'quantity' => quantity,
      'price' => (check_item['price'] * quantity)
    })
    $product_list.at(index)['quantity'] = check_item['quantity'] - quantity
    return true
  end
  false
end

def remove_from_cart(product_id)
  $cart_list.delete_if do |item|
    item['id'] == product_id
  end
  true
end

def update_cart(index, quantity)
  actual_index = $cart_list.find_index do |item|
    item['id'] == index
  end
  if actual_index
    $cart_list[actual_index]['quantity'] = quantity
    return true
  end
  false
end

def view_cart
  puts "Id \t Name \t Quantity \t Total Price"
  puts '------------------------------------------'
  $cart_list.each_with_index do |item, index|
    puts "#{index} \t #{item['name']} \t #{item['quantity']} \t\t #{item['price']}"
  end
  puts '------------------------------------------'
  true
end

def checkout(discount)
  total = 0
  $cart_list.each do |product_item|
    total = product_item['price'] + total
  end
  total -= 0.01 * discount * total
  puts "total bill is #{total}"
  true
end
# -------------------------------------------------------s

