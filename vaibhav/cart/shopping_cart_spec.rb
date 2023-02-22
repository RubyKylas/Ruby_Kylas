#shopping cart test cases

load 'shopping_cart.rb'

describe 'add_Products'  do
  context "when user put product information" do
        it "add products to inventory" do
          
            expect_any_instance_of(Kernel).to receive(:gets).and_return("apple")
            expect_any_instance_of(Kernel).to receive(:gets).and_return(120)
            expect_any_instance_of(Kernel).to receive(:gets).and_return(5)
            givenArray = [["apple",120,5]]
            result = Shopping_cart.new.Add_Products([])
            expect(result).to eq(givenArray)
      end
    end 
  end

  describe 'addTo_cart'  do
    context "when user put right product name" do
          it "add product to cart" do
           
            expect_any_instance_of(Kernel).to receive(:gets).and_return("orange")
            expect_any_instance_of(Kernel).to receive(:gets).and_return(5)
           
            givenArray = [["orange",150,5]]
            result = Shopping_cart.new.AddTo_cart([],[])
            expect(result).to eq(givenArray)
        end
      end 

      context "when user give worng product name" do
        it "does not add product to cart" do
         
          expect_any_instance_of(Kernel).to receive(:gets).and_return("orannge")
          result = Shopping_cart.new.AddTo_cart([],[])
          expect(result).to eq('enter a valid name')
      end
    end 
  end
  
  
    describe 'displayAll'  do
      context "in display all method" do
            it "is to check display all products" do
              
             givenArray = [["apple",120,5],["orange",150,10]]
             result = Shopping_cart.new.DisplayAll([])
             expect(result).to eq(givenArray)
        end
      end 
    end


    describe 'display_cart'  do
      context "in display cart method" do
            it "is to check display cart products" do
              
             givenArray = [["apple",120,5]]
             result = Shopping_cart.new.Display_cart([])
             expect(result).to eq(givenArray)
        end
      end 
    end

    describe 'deleteFrom_cart'  do
      context "when user put right product name" do
            it "user can delete from cart" do

            expect_any_instance_of(Kernel).to receive(:gets).and_return("orange")
             givenArray = [["apple",120,5]]
             result = Shopping_cart.new.DeleteFrom_cart([])
             expect(result).to eq(givenArray)
        end
      end 

      context "when user put wrong name" do
        it "user cannot delete from cart" do

        expect_any_instance_of(Kernel).to receive(:gets).and_return("orangge")
         result = Shopping_cart.new.DeleteFrom_cart([])
         expect(result).to eq('Enter a valid Name')
    end
  end       
end

    describe 'billAnd_referral'  do
      context "with right referral code" do
            it "user will get discounted amount" do

            expect_any_instance_of(Kernel).to receive(:gets).and_return("abcd")
             amount = 1425
             result = Shopping_cart.new.BillAnd_referral([])
             expect(result).to eq(amount)
        end
      end 

      context "with no or wrong referral code" do
        it "user will ot get discounted amount" do

        expect_any_instance_of(Kernel).to receive(:gets).and_return("abcdeee")
         amount = 1500
         result = Shopping_cart.new.BillAnd_referral([])
         expect(result).to eq(amount)
    end
  end
end

#shopping cart test cases