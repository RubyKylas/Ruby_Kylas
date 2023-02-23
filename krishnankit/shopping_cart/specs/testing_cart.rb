load 'E:\Kylas\Ruby\shopping_cart\code\service.rb'

describe "display_menu" do
  context "When display_menu function is called" do
    it "Should print menu array." do
      expect do
        display_menu()
    end.to output(%{\n\nPlease select an option to do corresponding operation.
0. Exit
1. Display products
2. Add products
3. Add to cart
4. Display cart
5. Generate Bill.
6. Delete product from cart.
}).to_stdout
    end
  end
end

describe "display_products" do
  context "When display_products function is called." do
    begin do
      products = [["Apple", 50000, 10], ["Asus", 15000, 10]]
    end
    it "Should print products array." do
      expect do
        display_products(products)
      end.to output(%{Name: Apple
Price: 50000
Quantity: 10
Name: Asus
Price: 15000
Quantity: 10
}).to_stdout
    end
  end
end

describe "display_cart" do
  context "When display_cart function is called " do
    begin do
      cart = [["Apple", 50000, 3], ["Asus", 15000, 2]]
    end
    it "Cart Should be displayed." do
      expect do
        display_cart(cart)
      end.to output(%{Name: Apple
Price: 50000
Quantity: 3
Name: Asus
Price: 15000
Quantity: 2
}).to_stdout
    end
  end
end

describe "add_to_cart" do
  context "When add_to_cart function is called" do
    begin do
      products = [["Apple", 50000], ["Asus", 15000]]
      cart  = []
      name = "Apple"
      quantity = 2
    end
    it "Product should be added to cart" do
      result = add_to_cart(products, cart, name, quantity)
      expect(result).to eq [["Apple", 50000, 2]]
    end
  end
end

describe "add_product" do
  context "When User adds new product." do
    begin do
      products = [["Apple", 50000]]
      name = "Asus"
      price = 15000
    end
    it "Product should be added to products." do
      result = add_product(products, name, price)
      expect(result).to eq [["Apple", 50000], ["Asus", 15000]]
    end
  end
end

describe "delete_from_cart" do
  context "When user enters name for product to be deleted." do
    begin do
      cart = [["Apple", 50000, 3], ["Asus", 15000, 2]]
      name = "Apple"
    end
    it "The product should be removed from cart."  do
      result = delete_from_cart(cart, name)
      expect(result).to eq [ ["Asus", 15000, 2]]
    end
  end
end

describe "generate_bill" do
  context "When user wants a bill and enter FIRST as coupon code." do
    begin do
      cart = Cart.new
      cart.products = [["Apple", 50000, 3], ["Asus", 15000, 2]]
      code = "FIRST"
    end
    it "Bill should be generated with 20% discount." do
      expect do
        generate_bill(cart, code)
      end.to output(%{You got 20% discount!
Your total price is: 180000
Payable amount is: 144000
}).to_stdout
    end
  end
end
