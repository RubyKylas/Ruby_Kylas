require '/home/dell/Documents/ruby/shop/shopcart_class'

describe Shop_cart do
    let(:bill) {Shop_cart.new}

    describe "Testing of add_product_to_stock => " do
        it "it should add the new product in the stock" do
            expect_any_instance_of(Kernel).to receive(:gets).and_return("Oneplus buds\n", "12.4 mm driver size\n", "1500.00\n", "20\n")
            expect{bill.add_product_to_stock}.to output("\nEnter the name of the product: \nEnter the description of the product: \nEnter the price of the product: \nEnter the quantity of the product: \nProduct 'Oneplus buds' has successfully added").to_stdout
            expect(bill.stock.size).to eq(1)
            expect(bill.stock["Oneplus buds"][:description]).to eq("12.4 mm driver size")
            expect(bill.stock["Oneplus buds"][:price]).to eq(1500.0)
            expect(bill.stock["Oneplus buds"][:quantity]).to eq(20)
        end
    end

    describe "Testing of list_all_products => " do
        context "when stock is empty" do
            it "then it should give an error message" do
                bill.stock = {}
                expect{bill.list_all_products}.to output("\nStock is empty\n").to_stdout
            end
        end

        context "when stock is not empty" do
            it "then it should list all the products in the stock" do
                bill.stock = {
                    "SONY TV" => {:description => "43 inch LED", :price => 45000.0, :quantity => 50},
                    "ONEPLUS BUDS" => {:description => "12.4 mm driver", :price => 1500.0, :quantity => 20}
                }
                expect{bill.list_all_products}.to output("\n\n---------- LIST OF ALL PRODUCTS ------------\n\nProduct: SONY TV\nDescription: 43 inch LED\nQuantity: 50\nPrice: 45000.0\n\nProduct: ONEPLUS BUDS\nDescription: 12.4 mm driver\nQuantity: 20\nPrice: 1500.0\n\n").to_stdout
            end
        end
    end

    describe "Testing of add_product_to_cart => " do

        context "when there's enough quantity of product in the stock" do
            context "and the product is new to the cart" do
                it "then it should add a product in the cart" do
                    bill.stock = {
                        "SONY TV" => {:description => "43 inch LED", :price => 45000.0, :quantity => 50},
                    }
                    bill.cart = {}
                    expect_any_instance_of(Kernel).to receive(:gets).and_return("SONY TV\n", "10\n")
                    expect{bill.add_product_to_cart}.to output("\nEnter the name of the product to add to cart: \nEnter the quantity to add to cart: \n\nProduct 'SONY TV' has successfully added to cart\n").to_stdout 
                    expect(bill.cart.size).to eq(1)
                    expect(bill.cart["SONY TV"][:quantity]).to eq(10)
                    expect(bill.stock["SONY TV"][:quantity]).to eq(40)
                end
            end
            context "and the product has already added in the cart" do
                it "then it should update a product quantity in the cart" do
                    bill.stock = {
                        "SONY TV" => {:description => "43 inch LED", :price => 45000.0, :quantity => 40},
                    }
                    bill.cart = {
                        "SONY TV" => {
                            :description => bill.stock["SONY TV"][:description],
                            :price => bill.stock["SONY TV"][:price], 
                            :quantity => 10
                        }
                    }
                    expect_any_instance_of(Kernel).to receive(:gets).and_return("SONY TV\n", "10\n")
                    expect{bill.add_product_to_cart}.to output("\nEnter the name of the product to add to cart: \nEnter the quantity to add to cart: \n\nProduct 'SONY TV' has successfully added to cart\n").to_stdout 
                    expect(bill.cart.size).to eq(1)
                    expect(bill.cart["SONY TV"][:quantity]).to eq(20)
                    expect(bill.stock["SONY TV"][:quantity]).to eq(30)
                end
            end
        end
        context "when there's not enough quantity of product in the stock" do
            it "then it should give an error message" do
                bill.stock = {
                    "SONY TV" => {:description => "43 inch LED", :price => 45000.0, :quantity => 50},
                }
                expect_any_instance_of(Kernel).to receive(:gets).and_return("SONY TV\n", "60\n")
                expect{ bill.add_product_to_cart }.to output("\nEnter the name of the product to add to cart: \nEnter the quantity to add to cart: \n\nSorry! We don't have enough stocks of Product 'SONY TV'\n").to_stdout
                expect(bill.cart.size).to eq(0)
                expect(bill.stock["SONY TV"][:quantity]).to eq(50)
            end
        end
        context "when the product is not found in the stock" do
            it "then it should give an error message" do
                bill.stock = {
                    "SONY TV" => {:description => "43 inch LED", :price => 45000.0, :quantity => 50},
                }
                expect_any_instance_of(Kernel).to receive(:gets).and_return("NOISE\n")
                expect{ bill.add_product_to_cart }.to output("\nEnter the name of the product to add to cart: \n\nWe don't have Product 'NOISE' in our stocks\n").to_stdout
                expect(bill.cart.size).to eq(0)
                expect(bill.stock.size).to eq(1)
            end
        end
    end

    describe "Testing of generate_bill => " do
        
        context "when cart is empty" do
            it "then it should give an error message" do
                expect {bill.generate_bill}.to output("\nCart is empty\n").to_stdout
            end
        end
    
        context "when cart is not empty" do
            it "then it should generate the bill" do
                bill.cart = {
                    "SONY TV" => {:description => "43 inch LED", :price => 45000.0, :quantity => 30},
                    "ONEPLUS BUDS" => {:description => "12.4 mm driver", :price => 1500.0, :quantity => 10}
                }
                expect {bill.generate_bill}.to output("---------------- BILL -----------------\n\nSONY TV - 30 x 45000.0 = 1350000.0\n\nONEPLUS BUDS - 10 x 1500.0 = 15000.0\n\n\nTotal: 1365000.0\n\n--------------- OFFERS -------------------------\n\nFlat 10% discount on minimum billing Rs. 100000\n\nFlat 20% discount on minimum billing Rs. 300000\n\nFlat 30% discount on minimum billing Rs. 500000\n\n------------------------------------------------\n\nHurrah! You are eligible for 30% discount\n\n\nFinal Total: 955500.0\n").to_stdout
            end
        end
    end
end
