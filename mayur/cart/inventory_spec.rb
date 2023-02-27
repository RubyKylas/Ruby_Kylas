require './inventory'

describe Inventory do
	describe '#add_item' do
		before(:each) do
			@inventory = Inventory.new()
		end
		context 'When testing the add item method name or quantity is not given' do
			it 'should return nil' do 
				expect(@inventory.add_item("soap", 10, nil)).to eq (nil)
			end
		end
		context 'When testing the add item method' do
			it 'should return list of products with new added item' do
				expect(@inventory.add_item("soap", 10, 10)).to eq ([{name: "soap",price: 10, quantity: 10}])
			end
		end
	end
	describe '#delete_item' do
		before(:each) do
			@inventory = Inventory.new()
			@inventory.products = [{name: "soap", price: 10, quantity: 10},{name: "pen", price: 10, quantity: 10}]
		end
		context 'When testing the delete item method if item is present' do
			it 'should give the deleted item' do 
				expect(@inventory.delete_item("soap")).to eq ([{name: "pen", price: 10, quantity: 10}])
			end
		end
		context 'When testing the delete item method if item is not present' do
			it 'should give array as it is' do
				expect(@inventory.delete_item("vim")).to eq ([{name: "soap", price: 10, quantity: 10},{name: "pen", price: 10, quantity: 10}])
			end
		end
	end
	describe '#add_code' do
		before(:all) do
			@inventory = Inventory.new()
		end
		context 'When testing the add code method if name or discount is nil' do
			it 'should return nil' do 
				expect(@inventory.add_code(nil, 10)).to eq (nil)
			end
		end
		context 'When testing the add code method ' do
			it 'should return the codes with the new code added' do
				expect(@inventory.add_code("code", 10)).to eq ([{ code: "code", discount: 10 }])
			end
		end
	end
end
