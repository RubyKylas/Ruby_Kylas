load 'inventory.rb'
load 'shop.rb'

def main
  inventory = Inventory.new(Array.new,Array.new)
  loop do
    print 'Inventory or Shop or End: '
    track = gets.chomp.downcase
    case track
    when 'inventory'
      loop do
        print 'AddItem or AddCode or Delete or Display: '
        operation = gets.chomp.downcase
        case operation
        when 'additem'
          print 'name,price,quantity: '
          item = gets.chomp.downcase.split(',')
          inventory.add_item(item[0],item[1].to_i,item[2].to_i)
        when 'addcode'
          print 'code,discount: '
          item = gets.chomp.downcase.split(',')
          inventory.add_code(item[0],item[1].to_i)
        when 'delete'
          print 'name: '
          item = gets.chomp.downcase
          inventory.delete_item(item)
        when 'display'
          puts inventory.products
        else
          break
        end
      end
    when 'shop'
      loop do
        shop = Shop.new(inventory.products,inventory.codes)
        print 'AddItem or checkout: '
        operation = gets.chomp.downcase
        case operation
        when 'additem'
          print 'name,quantity: '
          item = gets.chomp.downcase.split(',')
          shop.add_to_cart(item[0],item[1].to_i)
        when 'checkout'
          print 'code: '
          code = gets.chomp.downcase
          puts shop.checkout(code)
        else
          break 
        end
      end
    else
      break
    end
  end
end

main()