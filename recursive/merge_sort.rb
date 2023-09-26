def merge_sort(arr)
  return arr if arr.size == 1

  left, right = arr.each_slice((arr.length / 2.0).round).to_a
  left = merge_sort(left)
  right = merge_sort(right)

  merge(left, right)
end

def merge(left, right)
  i = 0
  j = 0
  result = []
  while i < left.size || j < right.size
    if left[i].nil?
      result.push(right[j])
      j += 1
      next
    end

    if right[j].nil?
      result.push(left[i])
      i += 1
      next
    end

    if left[i] <= right[j]
      result.push(left[i])
      i += 1
    else
      result.push(right[j])
      j += 1
    end
  end

  result
end

arr = Array.new(100) { rand(-100..100) }
p arr
p merge_sort(arr)
