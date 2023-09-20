@transactions = [10.21, -5.1, 4.09, 71, -9, 31.05, 22.0, 1.01, -12]

def transaction_statement
  @transactions.each do |transaction|
    yield transaction
  end
end

transaction_statement do |t|
  p format('%0.2f', t)
end

transaction_statement do |transaction|
  p format('Transaction: %0.0f', transaction)
end

def transaction_statement_2
  @transactions.each do |transaction|
    p yield transaction
  end
end

transaction_statement_2 do |t|
  format('Tran.: %.2f', t - 1)
end

def transaction_statement_3
  formatted_transactions = []
  @transactions.each do |t|
    formatted_transactions << yield(t)
  end

  p formatted_transactions
end

transaction_statement_3 do |t|
  format('%.5f', t)
end

transaction_statement_3 do |t|
  t * 2
end
