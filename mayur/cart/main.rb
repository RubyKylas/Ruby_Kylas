require './inventory'
require './shop'

def ask_for(keys)
  params = []
  keys.each do
    |key|
    print "Please Enter #{key}: "
    params.push(gets.strip.downcase || nil)
  end
  return params
end


def main(my_inventory = Inventory.new)

  get_parameter_names = lambda {|param| param[1]}
  
  inventory = my_inventory 
  shop = Shop.new(inventory.products,inventory.codes)
  
  menu = {
    inventory: {
      additem: [inventory.method(:add_item).to_proc, inventory.method(:add_item).parameters.map!(&get_parameter_names)],
      addcode: [inventory.method(:add_code).to_proc, inventory.method(:add_code).parameters.map!(&get_parameter_names)],
      delete: [inventory.method(:delete_item).to_proc, inventory.method(:delete_item).parameters.map!(&get_parameter_names)],
      display: [inventory.method(:display).to_proc, inventory.method(:display).parameters.map!(&get_parameter_names)]
    },
    shop: {
      additem: [shop.method(:add_to_cart).to_proc, shop.method(:add_to_cart).parameters.map!(&get_parameter_names)],
      checkout: [shop.method(:checkout).to_proc, shop.method(:checkout).parameters.map!(&get_parameter_names)],
      display: [shop.method(:display).to_proc, shop.method(:display).parameters.map!(&get_parameter_names)], 
    }
  }
  
  loop do
    print "Select #{menu.keys}: "
    track = gets.strip.downcase.to_sym
    menu.has_key?(track) ? track = menu[track] : break
    loop do 
      shop.update_inventory(inventory.products, inventory.codes)
      print "Select #{track.keys}: "
      operation = gets.strip.downcase.to_sym
      track.has_key?(operation) ? operation = track[operation] : break
      params = ask_for(operation[1])
      operation[0].call(*params)
    end
  end
end
