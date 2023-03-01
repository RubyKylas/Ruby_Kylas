#shopping cart test cases

require './shopping_cart.rb'
require './inventory.rb'

describe 'add_Products' do

  before do
    @inv_object = Inventory.new
    @givenArray = [["apple",120,5]]
  end

  context "when user put product information" do
    it "add products to inventory" do
        expect_any_instance_of(Kernel).to receive(:gets).and_return("apple",120,5)
        result = @inv_object.Add_Products([])
        expect(result).to eq(@givenArray)
    end
  end 

  context "when user put same product name" do
    it "does not add product to inventory" do
      expect_any_instance_of(Kernel).to receive(:gets).and_return("orange")
      result = @inv_object.Add_Products([])
      expect(result).to eq('product exist')
    end
  end
end

describe 'addTo_cart' do

  before do
    @cart_object = Shopping_cart.new
    @givenArray = [["orange",150,5]]
  end

  context "when user put right product name" do
    it "add product to cart" do
      expect_any_instance_of(Kernel).to receive(:gets).and_return("orange",5)
      result = @cart_object.AddTo_cart([],[])
      expect(result).to eq(@givenArray)
  end
end 

  context "when user give worng product name" do
    it "does not add product to cart" do
      expect_any_instance_of(Kernel).to receive(:gets).and_return("orannge")
      result = @cart_object.AddTo_cart([],[])
      expect(result).to eq('enter a valid name')
    end
  end 
end
  
  
describe 'displayAll'  do

  before do
    @inv_object = Inventory.new
    @givenArray = [["apple",120,5],["orange",150,10]]
  end
  
  context "in display all method" do
    it "displays the all products" do
      result = @inv_object.DisplayAll([])
      expect(result).to eq(@givenArray)
    end
  end 
end


describe 'display_cart'  do

  before do
    @cart_object = Shopping_cart.new
    @givenArray =  [["apple",120,5]]
  end

  context "in display cart method" do
    it "displays the cart" do
      result = @cart_object.Display_cart([])
      expect(result).to eq(@givenArray)
    end
  end 
end

describe 'deleteFrom_cart'  do

  before do
    @cart_object = Shopping_cart.new
    @givenArray =  [["apple",120,5]]
  end

  context "when user put right product name" do
    it "user can delete from cart" do
      expect_any_instance_of(Kernel).to receive(:gets).and_return("orange")
      result = @cart_object.DeleteFrom_cart([])
      expect(result).to eq(@givenArray)
    end
  end 

  context "when user put wrong name" do
    it "user cannot delete from cart" do
      expect_any_instance_of(Kernel).to receive(:gets).and_return("orangge")
      result = @cart_object.DeleteFrom_cart([])
      expect(result).to eq('Enter a valid Name')
    end
  end       
end

describe 'billAnd_referral'  do

  before do
    @cart_object = Shopping_cart.new
  end

  context "with right referral code" do
    it "user will get discounted amount" do
      expect_any_instance_of(Kernel).to receive(:gets).and_return("abcd")
      amount = 1425
      result = @cart_object.BillAnd_referral([])
      expect(result).to eq(amount)
    end
  end 

  context "with no or wrong referral code" do
    it "user will ot get discounted amount" do
      expect_any_instance_of(Kernel).to receive(:gets).and_return("abcdeee")
      amount = 1500
      result = @cart_object.BillAnd_referral([])
      expect(result).to eq(amount)
    end
  end
end

#shopping cart test cases