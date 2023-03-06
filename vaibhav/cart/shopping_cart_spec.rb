# Shopping cart test cases

require './ShoppingCart'
require './inventory'

describe 'add_products' do

  before do
    @inv_object = Inventory.new
    @given_array = [['apple', 120, 5]]
  end

  context 'when user put product information' do
    it 'add products to inventory' do
      expect_any_instance_of(Kernel).to receive(:gets).and_return('apple', 120, 5)
      result = @inv_object.add_products([])
      expect(result).to eq(@given_array)
    end
  end

  context 'when user put same product name' do
    it 'does not add product to inventory' do
      expect_any_instance_of(Kernel).to receive(:gets).and_return('orange')
      result = @inv_object.add_products([])
      expect(result).to eq('product exist')
    end
  end
end

describe 'add_to_cart' do

  before do
    @cart_object = ShoppingCart.new
    @given_array = [['orange', 150, 5]]
  end

  context 'when user put right product name' do
    it 'add product to cart' do
      expect_any_instance_of(Kernel).to receive(:gets).and_return('orange', 5)
      result = @cart_object.add_to_cart([], [])
      expect(result).to eq(@given_array)
    end
  end

  context 'when user give wrong product name' do
    it 'does not add product to cart' do
      expect_any_instance_of(Kernel).to receive(:gets).and_return('orannge')
      result = @cart_object.add_to_cart([], [])
      expect(result).to eq('enter a valid name')
    end
  end
end
  
describe 'display_all' do

  before do
    @inv_object = Inventory.new
    @given_array = [['apple', 120, 5], ['orange', 150, 10]]
  end
  
  context 'in display all method' do
    it 'displays the all products' do
      result = @inv_object.display_all([])
      expect(result).to eq(@given_array)
    end
  end
end


describe 'display_cart' do

  before do
    @cart_object = ShoppingCart.new
    @given_array = [['apple', 120, 5]]
  end

  context 'in display cart method' do
    it 'displays the cart' do
      result = @cart_object.display_cart([])
      expect(result).to eq(@given_array)
    end
  end
end

describe 'delete_cart' do

  before do
    @cart_object = ShoppingCart.new
    @given_array = [['apple', 120, 5]]
  end

  context 'when user put right product name' do
    it 'user can delete from cart' do
      expect_any_instance_of(Kernel).to receive(:gets).and_return('orange')
      result = @cart_object.delete_cart([])
      expect(result).to eq(@given_array)
    end
  end

  context 'when user put wrong name' do
    it 'user cannot delete from cart' do
      expect_any_instance_of(Kernel).to receive(:gets).and_return('orangge')
      result = @cart_object.delete_cart([])
      expect(result).to eq('Enter a valid Name')
    end
  end
end

describe 'bill_referral' do

  before do
    @cart_object = ShoppingCart.new
  end

  context 'with right referral code' do
    it 'user will get discounted amount' do
      expect_any_instance_of(Kernel).to receive(:gets).and_return('abcd')
      amount = 1425
      result = @cart_object.bill_referral([])
      expect(result).to eq(amount)
    end
  end

  context 'with no or wrong referral code' do
    it 'user will ot get discounted amount' do
      expect_any_instance_of(Kernel).to receive(:gets).and_return('abcdeee')
      amount = 1500
      result = @cart_object.bill_referral([])
      expect(result).to eq(amount)
    end
  end
end

# Shopping cart test cases
