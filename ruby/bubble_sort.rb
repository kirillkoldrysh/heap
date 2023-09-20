def bubble_sort(arr)
    loop do
        swapped = false
        
        arr.each_with_index do |el, i|
            next_i = i + 1
            break if next_i == arr.length
            
            if el > arr[next_i]
                arr[i] = arr[next_i]
                arr[next_i] = el
                swapped = true
            end
        end

        break unless swapped
    end

    arr
end

puts bubble_sort([4, 3, 78, 2, 0, 2]).to_s