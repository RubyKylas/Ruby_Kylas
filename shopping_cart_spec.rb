load 'shopping_cart.rb'


describe 'add_Products'  do
  context "given addProduct method" do
        it "is to check add products" do
          
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
    context "given addToCart method" do
          it "is to check add products" do
           
            expect_any_instance_of(Kernel).to receive(:gets).and_return("orange")
            expect_any_instance_of(Kernel).to receive(:gets).and_return(5)
           
            givenArray = [["orange",150,5]]
            result = Shopping_cart.new.AddTo_cart([],[])
            expect(result).to eq(givenArray)
        end
      end 

      context "given addToCart method else" do
        it "is to check add products else" do
         
          expect_any_instance_of(Kernel).to receive(:gets).and_return("orannge")
          result = Shopping_cart.new.AddTo_cart([],[])
          expect(result).to eq('enter a valid name')
      end
    end 
  end
  
  
    describe 'displayAll'  do
      context "given display all method" do
            it "is to check display method" do
              
             givenArray = [["apple",120,5],["orange",150,10]]
             result = Shopping_cart.new.DisplayAll([])
             expect(result).to eq(givenArray)
        end
      end 
    end


    describe 'display_cart'  do
      context "given display cart method" do
            it "is to check display cart method" do
              
             givenArray = [["apple",120,5]]
             result = Shopping_cart.new.Display_cart([])
             expect(result).to eq(givenArray)
        end
      end 
    end

    describe 'deleteFrom_cart'  do
      context "given deleteFrom_cart cart method" do
            it "is to check deleteFrom_cart method" do

            expect_any_instance_of(Kernel).to receive(:gets).and_return("orange")
             givenArray = [["apple",120,5]]
             result = Shopping_cart.new.DeleteFrom_cart([])
             expect(result).to eq(givenArray)
        end
      end 

      context "given deleteFrom_cart cart method else" do
        it "is to check deleteFrom_cart method else" do

        expect_any_instance_of(Kernel).to receive(:gets).and_return("orangge")
         result = Shopping_cart.new.DeleteFrom_cart([])
         expect(result).to eq('Enter a valid Name')
    end
  end       
end

    describe 'billAnd_referral'  do
      context "given billAnd_referral cart method" do
            it "is to check billAnd_referral method" do

            expect_any_instance_of(Kernel).to receive(:gets).and_return("abcd")
             amount = 1425
             result = Shopping_cart.new.BillAnd_referral([])
             expect(result).to eq(amount)
        end
      end 

      context "given billAnd_referral cart method else" do
        it "is to check billAnd_referral method else" do

        expect_any_instance_of(Kernel).to receive(:gets).and_return("abcdeee")
         amount = 1500
         result = Shopping_cart.new.BillAnd_referral([])
         expect(result).to eq(amount)
    end
  end
end