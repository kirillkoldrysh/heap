class Calculator
  def add(*args)
    args.inject(0) { |sum, n| sum + n }
  end

  def substract(*args)
    args.drop(1).inject(args[0]) { |result, n| result - n }
  end

  def multiply(*args)
    args.inject(1) { |result, n| result * n }
  end

  def divide(dividend, divisor)
    raise "Divisor can't be zero" if divisor.zero?

    dividend / divisor
  end
end
