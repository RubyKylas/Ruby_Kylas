# rubocop:disable Metrics/MethodLength, Style/ClassVars
# shopping cart

require './inventory'

# shopping cart
class ShoppingCart

  def add_to_cart(_cart, _ary)

    # print 'Enter the product name: '
    prd_name = gets
    # puts prd_name
    @@ary = [['apple', 120, 5], ['orange', 150, 10]]
    @@cart = []
    abc = @@ary.find { |x| x[0] == prd_name }

    if abc
      # print 'Enter qunatity of ', prd_name, ' '
      prd_quan = gets
      @@cart.push([prd_name, abc[1], prd_quan])
    else
      return 'enter a valid name'
    end

    @@cart
  end
      
  def display_cart(_cart)
    # puts '\ndisplaying your cart'
    @@cart = [['apple', 120, 5]]

    if @@ary.empty?
      'inventory is empty'
    else
      #  puts ' '
      # puts 'Name  Cost  Quantity'
      @@cart.each do |r|
        puts r.each { |p| }.join(' ')
      end
    end

    puts ' '
    @@cart
  end

  def delete_cart(_cart)
    puts 'which cart item u want to delete'
    prd_name = gets
    @@cart = [['apple', 120, 5], ['orange', 150, 10]]

    is_delete = @@cart.find { |x| x[0] == prd_name }
    if is_delete
      @@cart.delete_if { |x, *_| x == prd_name }
    else
      return 'Enter a valid Name'
    end
    @@cart
  end

  def bill_referral(cart)

    referal = %w[abcd ababab pqrst kakakakaka]
    puts 'Do you have any ref please enter below here'
    ref_name = gets
    @@cart = [['apple', 100, 5], ['orange', 100, 10]]

    amount = @@cart.inject(0) { |amt, i| amt + i[1].to_i * i[2].to_i }
    amount -= amount * 5 / 100 if referal.include?(ref_name)
    
    display_bill(amount, cart)
    amount
  end

  def display_bill(amount, cart)
    puts 'This is your detailed bill'
    print 'Billig is done for: '
    print '\nPhone no is: '
    print "\nThe total of your cart is: ", amount
    puts 'You have following items in your cart'
    display_cart(cart)
    puts 'Thank you for shopping with us!!!'
  end
end

# shopping cart
# rubocop:enable Metrics/MethodLength, Style/ClassVars
