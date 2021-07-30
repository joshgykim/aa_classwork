def bad_two_sum?(arr, target_sum)
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end
    false
end


arr = [0, 8, 7, 1, 4, 2]

# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => shoudl be false

# time complexity = O(n^2)   i.e. nested loops

def okay_two_sum?(arr, target_sum)
    sorted = arr.sort

    start_index = 0
    last_index = arr.length-1

    while start_index < last_index
        sum = sorted[start_index] + sorted[last_index]
        if sum == target_sum
            return true
        elsif sum > target_sum
            last_index -= 1
        else
            start_index += 1
        end
    end

    false
end

# p okay_two_sum?(arr, 6) # => true
# p okay_two_sum?(arr, 18) # => false

# time complexity => O(n log n + n) => O(n log n)

arr = [0, 8, 7, 1, 4, 2]

# target = 

# counter = { 0: 1,
#             8: 1,
#             7: 1,
#             1: 1,
#             4: 1,
#             2: 1 }

def great_two_sum?(arr, target_sum)
    counter = Hash.new(0)

    arr.each do |ele|
        counter[ele] += 1
    end

    arr.each do |num|
        if counter[ target_sum - num ] != 0
            return true
        end
    end

    false
end

# p great_two_sum?(arr, 6)
# p great_two_sum?(arr, 18)
# p great_two_sum?(arr, 8)
# p great_two_sum?(arr, 3)
