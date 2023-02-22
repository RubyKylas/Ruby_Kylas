require_relative "../code/service.rb"

describe "menu" do
  context "When display_menu function is called" do
    it "Should print menu array." do
      expect do
        menu()
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

describe "inventory.display" do
  context "When display_products function is called." do
    it "Should print products array." do
      inventory = Inventory.new
      inventory.products = [Product.new('Apple', 50000), Product.new('Asus', 15000)]
      expect do
        inventory.display
      end.to output(%{Name: Apple.
Price: 50000.
Name: Asus.
Price: 15000.
}).to_stdout
    end
  end
end

describe "cart.display" do
  context "When display_cart function is called " do
    it "Cart Should be displayed." do
      cart = Cart.new
      cart.products = [[Product.new('Apple', 50000), 3], [Product.new('Asus', 15000), 2]]
      expect do
        cart.display
      end.to output(%{Name: Apple.
Price: 50000.
Quantity: 3.
Name: Asus.
Price: 15000.
Quantity: 2.
}).to_stdout
    end
  end
end

describe "cart.generate_bill" do
  context "When user wants a bill and enter FIRST as coupon code." do
    it "Bill should be generated with 20% discount." do
      cart = Cart.new
      cart.products = [[Product.new('Apple', 50000), 3], [Product.new('Asus', 15000), 2]]
      code = "FIRST"
      expect do
        cart.generate_bill(code)
      end.to output(%{You got 20% discount!
Total price: 180000
Amount payable is: 144000
}).to_stdout
    end
  end

  context "When user wants a bill and enter COUPN as coupon code." do
    it "Bill should be generated with 10% discount." do
      cart = Cart.new
      cart.products = [[Product.new('Apple', 50000), 3], [Product.new('Asus', 15000), 2]]
      code = "COUPN"
      expect do
        cart.generate_bill(code)
      end.to output(%{You got 10% discount!
Total price: 180000
Amount payable is: 162000
}).to_stdout
    end
  end

  context "When user wants a bill and enter no or wrong as coupon code." do
    it "Bill should be generated with no discount." do
      cart = Cart.new
      cart.products = [[Product.new('Apple', 50000), 3], [Product.new('Asus', 15000), 2]]
      code = ""
      expect do
        cart.generate_bill(code)
      end.to output(%{You got no discount.
Total price: 180000
Amount payable is: 180000
}).to_stdout
    end
  end
end

describe "cart.add_product" do
  context "When add_product function is called" do
    it "Product should be added to cart" do
      apple = Product.new('Apple', 50000)
      asus = Product.new('Asus', 15000)
      products = [apple, asus]
      cart  = Cart.new
      name = "Apple"
      quantity = 2
      result = cart.add_product(name, quantity, products)
      expect(result).to eql [[apple, 2]]
    end
  end

  context "When add_product function is called and that product is not available in inventory" do
    it "User should see Product is not available." do
      apple = Product.new('Apple', 50000)
      asus = Product.new('Asus', 15000)
      products = [apple, asus]
      cart  = Cart.new
      name = "Realme"
      quantity = 2
      expect do
        cart.add_product(name, quantity, products)
      end.to output("Product is not available.\n").to_stdout
    end
  end
end

describe "inventory.add_product" do
  context "When User adds new product." do
    it "Product should be added to products." do
      apple = Product.new('Apple', 50000)
      asus = Product.new('Asus', 15000)
      inventory = Inventory.new
      inventory.products = [apple]
      result = inventory.add_product(asus)
      expect(result).to eq [apple, asus]
    end
  end
end

describe "cart.delete_product" do
  context "When user enters name for product to be deleted." do
    it "The product should be removed from cart."  do
      apple = Product.new('Apple', 50000)
      asus = Product.new('Asus', 15000)
      cart = Cart.new
      cart.products = [[apple, 3], [asus, 2]]
      name = "Apple"
      result = cart.delete_product(name)
      expect(result).to eq [[asus, 2]]
    end
  end

  context "When user enters name for product to be deleted and it is not present in cart." do
    it "User should see Product not found in cart."  do
      apple = Product.new('Apple', 50000)
      asus = Product.new('Asus', 15000)
      cart = Cart.new
      cart.products = [[apple, 3], [asus, 2]]
      name = "Realme"
      expect do
        cart.delete_product(name)
      end.to output("Product not found in cart.\n").to_stdout
    end
  end
end
