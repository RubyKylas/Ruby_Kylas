require '/home/dell/ruby_Kylas/jigar/shop/shopcart'

describe "Shop_cart" do
    before do
        $stock = {}
        $cart = {}
    end

    describe "Testing of add_product_to_stock => " do
        it "it should add the new product in the stock" do
            expect_any_instance_of(Kernel).to receive(:gets).and_return("Oneplus buds\n", "12.4 mm driver size\n", "1500.00\n", "20\n")
            add_product_to_stock
            expect($stock).to eq({"Oneplus buds" => {:description => "12.4 mm driver size", :price => 1500.0, :quantity => 20}})
        end
    end

    describe "Testing of list_all_products => " do
        context "when stock is empty" do
            it "then it should give an error message" do
                $stock = {}
                expect{list_all_products}.to output("\nStock is empty\n").to_stdout
            end
        end

        context "when stock is not empty" do
            it "then it should list all the products in the stock" do
                $stock = {
                    "SONY TV" => {:description => "43 inch LED", :price => 45000.0, :quantity => 50},
                    "ONEPLUS BUDS" => {:description => "12.4 mm driver", :price => 1500.0, :quantity => 20}
                }
                expect{list_all_products}.to output("\n\n---------- LIST OF ALL PRODUCTS ------------\n\nProduct: SONY TV\nDescription: 43 inch LED\nQuantity: 50\nPrice: 45000.0\n\nProduct: ONEPLUS BUDS\nDescription: 12.4 mm driver\nQuantity: 20\nPrice: 1500.0\n\n").to_stdout
            end
        end
    end

    describe "Testing of add_product_to_cart => " do

        context "when there's enough quantity of product in the stock" do
            context "and the product is new to the cart" do
                before(:each) do
                    $stock = {
                        "SONY TV" => {:description => "43 inch LED", :price => 45000.0, :quantity => 50},
                    }
                    $cart = {}  
                end
                it "then it should add a product in the cart and cart size increases by 1" do  
                    expect_any_instance_of(Kernel).to receive(:gets).and_return("SONY TV\n", "10\n")
                    add_product_to_cart
                    expect($cart.size).to eq(1)
                end
                it "then it should add a product in the cart and product quantity should be 10 in cart" do
                    expect_any_instance_of(Kernel).to receive(:gets).and_return("SONY TV\n", "10\n")
                    add_product_to_cart
                    expect($cart["SONY TV"][:quantity]).to eq(10)
                end
                it "then it should add a product in the cart and product quantity should be reduced by 10 in stock" do
                    expect_any_instance_of(Kernel).to receive(:gets).and_return("SONY TV\n", "10\n")
                    add_product_to_cart
                    expect($stock["SONY TV"][:quantity]).to eq(40)
                end                
            end
            context "and the product has already added in the cart" do
                before(:each) do
                    $stock = {
                        "SONY TV" => {:description => "43 inch LED", :price => 45000.0, :quantity => 40},
                    }
                    $cart = {
                        "SONY TV" => {
                            :description => $stock["SONY TV"][:description],
                            :price => $stock["SONY TV"][:price], 
                            :quantity => 10
                        }
                    }
                end
                it "then it should update a product quantity in the cart and cart size should not be changed" do
                    expect_any_instance_of(Kernel).to receive(:gets).and_return("SONY TV\n", "10\n")
                    add_product_to_cart
                    expect($cart.size).to eq(1)
                end
                it "then it should update a product quantity in the cart and product quantity should increase by 10 in cart" do
                    expect_any_instance_of(Kernel).to receive(:gets).and_return("SONY TV\n", "10\n")
                    add_product_to_cart
                    expect($cart["SONY TV"][:quantity]).to eq(20)
                end
                it "then it should update a product quantity in the cart and product quantity should reduce by 10 in stock" do
                    expect_any_instance_of(Kernel).to receive(:gets).and_return("SONY TV\n", "10\n")
                    add_product_to_cart
                    expect($stock["SONY TV"][:quantity]).to eq(30)
                end
            end
        end
        context "when there's not enough quantity of product in the stock" do
            before(:each) do
                $stock = {
                    "SONY TV" => {:description => "43 inch LED", :price => 45000.0, :quantity => 50},
                }
                $cart = {}
            end
            it "then it should give an error message" do
                expect_any_instance_of(Kernel).to receive(:gets).and_return("SONY TV\n", "60\n")
                expect{ add_product_to_cart }.to output("\nEnter the name of the product to add to cart: \nEnter the quantity to add to cart: \n\nSorry! We don't have enough stocks of Product 'SONY TV'\n").to_stdout
            end
            it "then it should not add the product in cart and cart size should not changed" do
                expect_any_instance_of(Kernel).to receive(:gets).and_return("SONY TV\n", "60\n")
                add_product_to_cart
                expect($cart.size).to eq(0)
            end
            it "then it should not add the product in cart and product quantity should not changed in stock" do
                expect_any_instance_of(Kernel).to receive(:gets).and_return("SONY TV\n", "60\n")
                add_product_to_cart
                expect($stock["SONY TV"][:quantity]).to eq(50)
            end
        end
        context "when the product is not found in the stock" do
            before(:each) do
                $stock = {
                    "SONY TV" => {:description => "43 inch LED", :price => 45000.0, :quantity => 50},
                }
                $cart = {}
            end
            it "then it should give an error message" do
                expect_any_instance_of(Kernel).to receive(:gets).and_return("NOISE\n")
                expect{ add_product_to_cart }.to output("\nEnter the name of the product to add to cart: \n\nWe don't have Product 'NOISE' in our stocks\n").to_stdout
            end
            it "then it should not add product in cart" do
                expect_any_instance_of(Kernel).to receive(:gets).and_return("NOISE\n")
                add_product_to_cart
                expect($cart.size).to eq(0)
            end
            it "then it should not modify the stock" do
                expect_any_instance_of(Kernel).to receive(:gets).and_return("NOISE\n")
                add_product_to_cart
                expect($stock.size).to eq(1)
            end
        end
    end
    
    describe "Testing of generate_bill => " do
        
        context "when cart is empty" do
            it "then it should give an error message" do
                expect {generate_bill}.to output("\nCart is empty\n").to_stdout
            end
        end
    
        context "when cart is not empty" do
            it "then it should generate the bill" do
                $cart = {
                    "SONY TV" => {:description => "43 inch LED", :price => 45000.0, :quantity => 30},
                    "ONEPLUS BUDS" => {:description => "12.4 mm driver", :price => 1500.0, :quantity => 10}
                }
                expect {generate_bill}.to output("---------------- BILL -----------------\n\nSONY TV - 30 x 45000.0 = 1350000.0\n\nONEPLUS BUDS - 10 x 1500.0 = 15000.0\n\n\nTotal: 1365000.0\n\n--------------- OFFERS -------------------------\n\nFlat 10% discount on minimum billing Rs. 100000\n\nFlat 20% discount on minimum billing Rs. 300000\n\nFlat 30% discount on minimum billing Rs. 500000\n\n------------------------------------------------\n\nHurrah! You are eligible for 30% discount\n\n\nFinal Total: 955500.0\n").to_stdout
            end
        end
    end
end
    
