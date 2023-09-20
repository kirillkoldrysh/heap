def stock_picker(stocks)
    return nil if stocks.length < 2
    max_profit = nil
    result = nil

    stocks.each_with_index do |sell, i_sell|
        stocks[(i_sell + 1)..stocks.length].each_with_index do |buy, i_buy|
            profit = buy - sell
            if profit > 0 && (max_profit.nil? || profit > max_profit)
                max_profit = profit
                result = [i_sell, i_buy + i_sell + 1]    
            end
        end
    end

    result
end

# Version by Kropyls
# https://github.com/Kropyls/Stock-Picker/blob/main/stock-picker.rb
def stock_picker_kropyls(prices)
  results = prices.each_with_index.to_a.combination(2).max_by{|buy,sell| sell[0]-buy[0]}.map{|price, i| i}
end

# Version by mastertenshi
# https://github.com/mastertenshi/ruby_scripts/blob/main/stock_picker.rb
def stock_picker_mastertenshi(prices)
  min_p = prices[0]
  min_i = 0

  profit = 0
  days = [0, 0]

  prices.each_with_index do |p, i|
    if p < min_p
      min_p = p
      min_i = i
      next
    end
    
    if p - min_p > profit
      profit = p - min_p
      days = [min_i, i]
    end
  end
  
  days
end

puts stock_picker([17,3,6,9,15,8,6,1,10]).to_s