require './lib/calculator'

describe Calculator do
  describe '#add' do
    it 'returns the sum of two numbers' do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end

    it 'returns the sum of two negative numbers' do
      calculator = Calculator.new
      expect(calculator.add(-1, -7)).to eql(-8)
    end

    it 'returns the sum of negative and positive number' do
      calculator = Calculator.new
      expect(calculator.add(-1, 7)).to eql(6)
    end

    it 'returns the sum of number and zero' do
      calculator = Calculator.new
      expect(calculator.add(0, 7)).to eql(7)
    end

    it 'returns the sum of more than two numbers' do
      calculator = Calculator.new
      expect(calculator.add(1, 2, 3)).to eql(6)
    end

    it 'returns same element in case if argument is just one' do
      calc = Calculator.new
      expect(calc.add(1)).to eql(1)
    end
  end

  describe '#substract' do
    it 'return substraction of two numbers' do
      calculator = Calculator.new
      expect(calculator.substract(5, 2)).to eql(3)
    end

    it 'return substraction of more that two numbers' do
      calc = Calculator.new
      expect(calc.substract(5, 1, 3)).to eql(1)
    end
  end

  describe '#multiply' do
    it 'return multiplication of two numbers' do
      calc = Calculator.new
      expect(calc.multiply(4, 7)).to eql(28)
    end

    it 'return multiplication of negative and positive numbers' do
      calc = Calculator.new
      expect(calc.multiply(4, -7)).to eql(-28)
    end

    it 'return multiplication of two negative numbers' do
      calc = Calculator.new
      expect(calc.multiply(-4, -7)).to eql(28)
    end

    it 'return multiplication of number and zero' do
      calc = Calculator.new
      expect(calc.multiply(18, 0)).to eql(0)
    end

    it 'return multiplication of more than two numbers' do
      calc = Calculator.new
      expect(calc.multiply(4, 7, 2)).to eql(56)
    end
  end

  describe '#divide' do
    it 'return division of two numbers' do
      calc = Calculator.new
      expect(calc.divide(28, 4)).to eql(7)
    end

    it 'return division of two negative numbers' do
      calc = Calculator.new
      expect(calc.divide(-28, -4)).to eql(7)
    end

    it 'return division of negative and positive numbers' do
      calc = Calculator.new
      expect(calc.divide(28, -4)).to eql(-7)
    end

    it 'return division of zero and number' do
      calc = Calculator.new
      expect(calc.divide(0, 10)).to eql(0)
    end

    it 'raise exception in case division of number and zero' do
      calc = Calculator.new
      # expect { raise 'ouch' }.to raise_error
      # expect(calc.divide(10, 0)).to raise_error("Divisor can't be zero")
      expect { calc.divide(10, 0) }.to raise_error
    end
  end
end
