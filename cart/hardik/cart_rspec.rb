load 'service.rb'

# # * testing add_product method
# # ---------------------------------------------------
describe 'add_product' do
  context 'when testing add_product function' do
    it 'it should return an object having key as name, quantity and price' do
      name = 'nirma'
      quantity = 10
      price = 50
      result = add_product(name, quantity, price)
      expect(result).to eq({'name' => name , 'quantity' => quantity, 'price' => price})
    end
  end
end
# ---------------------------------------------------

# * testing view_inventory function
# ---------------------------------------------------
describe 'view_inventory' do
  context 'when testing view_inventory function ' do
    it 'should return true if printed successfully' do
      name = 'nirma'
      quantity = 10
      price = 50
      result = view_inventory([{
        'name' => name,
        'quantity' => quantity,
        'price' => price
      }])
      expect(result).to eq(true)
    end
  end
end
# ---------------------------------------------------

# * testing add_to_cart function
# ---------------------------------------------------
describe 'add_to_cart' do
  context 'testing add_to_cart function' do
    it 'should return true if the required quantity is less than actual available quantity' do
      index = 0
      quantity = 0
      result = add_to_cart(index, quantity)
      expect(result).to eq(false)
    end
  end
end
# ---------------------------------------------------

# # * testing remove_from_cart function
# ---------------------------------------------------
describe 'remove_from_cart' do
  context 'testing remove_from_cart function' do
    it 'should return true if the item is removed from the cart' do
      product_id = 0
      result = remove_from_cart(product_id)
      expect(result).to eq(true)
    end
  end
end
# ---------------------------------------------------

# # * testing update_cart function
# ---------------------------------------------------
describe 'update_cart' do
  context 'testing update_cart function' do
    it 'should return false if the item is not present in the cart' do
      index = 0
      quantity = 10
      result = update_cart(index, quantity)
      expect(result).to eq(false)
    end
  end
end
# ---------------------------------------------------

# # * testing view_cart function
# ---------------------------------------------------
describe 'view_cart' do
  context 'testing view_cart function' do
    it 'should return true on successful printing of the result' do
      result = view_cart()
      expect(result).to eq(true)
    end
  end
end
# ---------------------------------------------------

# # * testing checkout function
# ---------------------------------------------------
describe 'checkout' do
  context 'testing checkout function' do
    it 'should return true on successful checkout' do
      discount = 10
      result = checkout(discount)
      expect(result).to eq(true)
    end
  end
end
# ---------------------------------------------------

