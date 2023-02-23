require './shop.rb'

describe Shop do
	
	describe ' #add to cart ' do
		before(:all) do
			products = [
				{name:"soap", price: 10, quantity: 10},
				{name:"brush", price: 10, quantity: 10}
			]
			codes = [
				{code:"CODE", discount:10}
			]
			@shop = Shop.new(products, codes)
		end

		context 'When Testing the add to cart method if name or quantity is nil ' do
			it 'should return nil' do 
				expect(@shop.add_to_cart(nil, 10)).to eq (nil)
				expect(@shop.add_to_cart("soap", nil)).to eq (nil)
			end
		end

		context 'When Testing the add to cart method if item is not present ' do
			it 'should return nil' do 
				expect(@shop.add_to_cart("watch", nil)).to eq (nil)
			end
		end

		context 'When Testing the add to cart method if item is present ' do
			it 'should return updated cart' do 
				expect(@shop.add_to_cart("soap", 10)).to eq ({"soap"=>[10,10]})
				expect(@shop.add_to_cart("brush", 10)).to eq ({"soap"=>[10,10],"brush"=>[10,10]})
			end
		end
	end

	describe ' #checkout ' do
		before(:all) do
			products = [
					{name:"soap", price: 10, quantity: 10},
					{name:"brush", price: 10, quantity: 10}
			]
			codes = [
					{code:"CODE", discount:10}
			]
			@shop = Shop.new(products, codes)
			@shop.add_to_cart("soap", 10)
			@shop.add_to_cart("brush", 10)
		end

		context 'When Testing the checkout method if code is present ' do
			it 'should return original total amount' do 
					expect(@shop.checkout(nil)).to eq (200)
			end
		end

		context 'When Testing the checkout method if code is present ' do
			it 'should return 10 percent discounted total amount' do 
					expect(@shop.checkout("CODE")).to eq (180)
			end
		end
	end
end
