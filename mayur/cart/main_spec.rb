require './main.rb'

describe ' #main ' do
  context 'When testing main method for inventory choice' do
    context 'when  testing inventory track if item is added' do
      before(:each)do
        @inventory = Inventory.new(Array.new, Array.new)
      end
      it 'should add the item' do
        expect_any_instance_of(Kernel).to receive(:gets).and_return('inventory')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('additem')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('soap,10,10')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('end')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('end')
        main(@inventory)
        expect(@inventory.products.length).to eq (1)
      end
    end
    context 'when  testing inventory track if code is added' do
      before(:each)do
        @inventory = Inventory.new(Array.new, Array.new)
      end
      it 'should add the item' do
        expect_any_instance_of(Kernel).to receive(:gets).and_return('inventory')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('addcode')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('soap,10')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('end')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('end')
        main(@inventory)
        expect(@inventory.codes.length).to eq (1)
      end
    end
    context 'when  testing inventory track if item is deleted' do
      before(:each)do
        @inventory = Inventory.new([{name: "soap", quantity: 10, price: 10}], Array.new)
      end
      it 'should add the item' do
        expect_any_instance_of(Kernel).to receive(:gets).and_return('inventory')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('delete')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('soap')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('end')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('end')
        main(@inventory)
        expect(@inventory.products.length).to eq (0)
      end
    end
  end
  context 'When testing main method for shop choice' do
    context 'when testing shop track if item is added to cart' do
      before(:each)do
        @inventory = Inventory.new([{name: "soap", quantity: 10, price: 10}], Array.new)
      end
      it 'should add the item' do
        expect_any_instance_of(Kernel).to receive(:gets).and_return('shop')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('additem')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('soap,10')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('end')
        expect_any_instance_of(Kernel).to receive(:gets).and_return('end')
        main(@inventory)
        expect(@inventory.products[0][:quantity]).to eq (10)
      end
    end
  end
end