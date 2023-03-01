#shopping cart

require './inventory.rb'

class Shopping_cart

  def AddTo_cart(cart, ary)

    print 'Enter the product name: '
    prdName = gets
    puts prdName
    @@ary = [["apple",120,5], ["orange",150,10]]
    @@cart = []
    abc = @@ary.find{ |x| x[0] == prdName }

    if abc
      print 'Enter qunatity of ', prdName, ' '
      prdQuan = gets 
      @@cart.push([prdName, abc[1], prdQuan])
    else
      return 'enter a valid name'
    end

    return @@cart
  end
      
  def Display_cart(cart)
    puts '\ndisplaying your cart'
    @@cart = [["apple", 120, 5]]

    if @@ary.length == 0
      return 'inventory is empty'
    else
      puts ' '
      puts 'Name  Cost  Quantity'
      @@cart.each do |r|
        puts r.each { |p| p }. join(' ')
      end
    end
      puts ' '
    return @@cart
  end

  def DeleteFrom_cart(cart)
    puts 'which cart item u want to delete'
    prdName = gets
    @@cart = [["apple",120,5], ["orange",150,10]]

    isDelete = @@cart.find { |x| x[0] == prdName }
    if isDelete
      @@cart.delete_if { |x, *_| x == prdName }
    else
      return 'Enter a valid Name'
    end
    return @@cart
  end

  def BillAnd_referral(cart)

    referal = %w[abcd ababab pqrst kakakakaka]
    amount = 0
    puts 'Do you have any ref please enter below here'
    refName = gets
    @@cart = [["apple",100,5], ["orange",100,10]]

    if referal.include?(refName)
      amount = @@cart.inject(0) { |amount, i| amount + i[1].to_i*i[2].to_i }
      amount -= amount*5/100
    else
      amount = @@cart.inject(0) { |amount, i| amount + i[1].to_i*i[2].to_i }
    end
    
    Display_bill(amount,cart)
    return amount
  end

  def Display_bill(amount, cart)
    puts 'This is your detailed bill'
    print 'Billig is done for: '
    print "\nPhone no is: "
    print "\nThe total of your cart is: ",amount
    puts 'You have following items in your cart'
    Display_cart(cart)
    puts 'Thank you for shopping with us!!!'
  end

end

#shopping cart