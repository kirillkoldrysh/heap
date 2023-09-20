module Enumerable
  def my_each_with_index(&my_proc)
    for i in 0..(length - 1) do
      my_proc.call(self[i], i)
    end

    self
  end

  def my_select(&my_proc)
    res = []

    return self unless block_given?

    for i in 0..(length - 1) do
      res.push(self[i]) if my_proc.call(self[i])
    end

    res
  end

  def my_all?(&my_proc)
    return false unless block_given?

    for i in 0..(length - 1) do
      return false unless my_proc.call(self[i])
    end

    true
  end

  def my_any?(&my_proc)
    return false unless block_given?

    for i in 0..(length - 1) do
      return true if my_proc.call(self[i])
    end

    false
  end

  def my_none?(&my_proc)
    return false unless block_given?

    for i in 0..(length - 1) do
      return false if my_proc.call(self[i])
    end

    true
  end

  def my_count(&my_proc)
    return length unless block_given?

    res = 0
    for i in 0..(length - 1) do
      res += 1 if my_proc.call(self[i])
    end

    res
  end

  def my_map(&my_proc)
    return self unless block_given?

    res = []
    for i in 0..(length - 1) do
      res.push my_proc.call(self[i])
    end

    res
  end

  def my_inject(initial = 0, &my_proc)
    accumulator = initial

    for i in 0..(length - 1) do
      accumulator = my_proc.call(accumulator, self[i])
    end

    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&my_proc)
    i = 0
    while i < length
      my_proc.call(self[i])

      i += 1
    end

    self
  end
end
