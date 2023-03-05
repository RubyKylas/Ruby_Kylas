require './main'

describe Menu do
  let(:obj) {Menu.new}

  describe "add_to_menu" do
    it "it should add the new product in the stock" do
      obj.add_to_menu("Tshirt", 250, 30)
      expect(obj.menu).to eq({"Tshirt"=>{:price=>250, :quantity=>30}, "Apple"=>{:price=>200, :quantity=>20}, "Mobile" => {:price => 20000, :quantity => 35}, "Watch" => {:price => 3999, :quantity => 15}})
    end
  end

  describe "print_menu" do
    it "it should display all products inside menu" do
      expect{obj.print_menu()}.to output("Name | Price | Quantity\nApple    200      20   \nMobile    20000      35   \nWatch    3999      15   \n").to_stdout
    end
  end

end

describe Cart do
  let(:m) {Menu.new}
  let(:obj) {Cart.new(m)}

  describe "add_to_cart" do
    context "successfully adds product because" do
      before do
        m.menu = {"Laptop" => {:price => 80000, :quantity => 2}}
      end
      it "product exists in the stock" do
        obj.add_to_cart("Laptop", 1)
        expect(obj.cart).to eq({"Laptop" => {:price => 80000, :quantity => 1},"Apple" => {:price => 200, :quantity => 10}})
      end
    end
    
    context "fails to add product because" do
      it "product does not exists" do
        obj.add_to_cart("Laptop", 2)
        expect{obj.add_to_cart("Laptop", 2)}.to output("We do not have Laptop item in menu.\n").to_stdout
      end
    end     
  end

  describe "print_cart" do
    it "it should display all products inside menu" do
      expect{obj.print_cart()}.to output("Name | Price | Quantity\nApple    200      10   \n").to_stdout
    end
  end

  describe "remove_from_cart" do
    context "successfully removes product because" do
      it "quantity to be removed is less than or equal to available quantity in cart" do 
        obj.remove_from_cart("Apple", 8)
        expect(obj.cart).to eq({"Apple" => {:price => 200, :quantity => 2}}) 
      end 
    end
    
    context "fails to removes product because" do
      it "quantity to be removed is greater than available quantity in cart" do 
        obj.remove_from_cart("Apple", 12)
        expect(obj.cart).to eq({"Apple" => {:price => 200, :quantity => 10}}) 
      end 
      
      it "product does not exists in cart" do 
        obj.remove_from_cart("TV", 1)
        expect(obj.cart).to eq({"Apple" => {:price => 200, :quantity => 10}}) 
      end 
    end
  end 
  
  describe "make_bill" do
    before do
      obj.cart = {"Apple" => {:price => 200, :quantity => 10}, "Mobile" => {:price => 20000, :quantity => 2}}
      @gross_amount = 0.0
    end

    context "calculate_gross_bill" do
      it "calculates gross bill of all products in cart" do 
        @gross_amount = obj.calculate_gross_bill()
        expect(@gross_amount).to eq(42000.0) 
      end 
    end

    context "calculate_gst" do
      it "calculates total gst applicable over gross bill of all products in cart" do 
        expect(obj.calculate_gst(42000)).to eq(6720.0) 
      end 
    end

    context "calulate_discount" do
      it "calculates total discount applicable over gross bill of all products in cart" do 
        expect(obj.calulate_discount(42000)).to eq(12600.0) 
        expect{obj.calulate_discount(42000)}.to output("We have 10%, 20% and 30% discount based on your bill\nYour discount amount is: 12600.0\n").to_stdout
      end 
      
      it "prints correct message" do 
        expect{obj.calulate_discount(42000)}.to output("We have 10%, 20% and 30% discount based on your bill\nYour discount amount is: 12600.0\n").to_stdout
      end 
    end
  end 

end
