require './inventory'
require './shop'

def main(my_inventory = Inventory.new)
  inventory = my_inventory 
  # User Menu to select Shopping or Inventory Management
  loop do
    print 'Inventory or Shop or End: '
    choice = gets.strip.downcase
    case choice
    when 'inventory'
      # User Menu to handle Inventory Management
      loop do
        print 'AddItem or AddCode or Delete or Display: '
        operation = gets.strip.downcase
        case operation
        when 'additem'
          print 'name,price,quantity: '
          item = gets.strip.downcase.split(',')
          inventory.add_item(item[0], item[1].to_i, item[2].to_i)
        when 'addcode'
          print 'code,discount: '
          item = gets.strip.downcase.split(',')
          inventory.add_code(item[0], item[1].to_i)
        when 'delete'
          print 'name: '
          item = gets.strip.downcase
          inventory.delete_item(item)
        when 'display'
          puts inventory.products
        else
          break
        end
      end
    when 'shop'
      # User Menu to handle shopping
      shop = Shop.new(inventory.products,inventory.codes)
      loop do
        print 'AddItem or checkout or Display: '
        operation = gets.strip.downcase
        case operation
        when 'additem'
          print 'name,quantity: '
          item = gets.strip.downcase.split(',')
          shop.add_to_cart(item[0], item[1].to_i)
        when 'checkout'
          print 'code: '
          code = gets.strip.downcase
          puts shop.checkout(code)
        when 'display'
          shop.display_cart()
        else
          break 
        end
      end
    else
      break
    end
  end
end
