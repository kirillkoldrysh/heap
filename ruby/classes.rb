class Invoice
  attr_accessor :number
  def initialize(number, total_amount)
    @number = number
    @total_amount = total_amount
  end
end

class Order < Invoice
  def initialize(number, total_amount, vs)
    @number = number
    @total_amount = total_amount
    @vs = vs
  end
end

invoice = Invoice.new('OBJ00001', 100.00)
invoice.number = 'OBJ00002'
p invoice.number

order = Order.new('OBJ00003', 10.00, '8001')
p order.number = 'OBJ00004'
