# #my_min
# PHASE 1

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
def my_min1(arr)
    smallest = arr.first
    arr.each do |i|
        arr.each do |j|
            smallest = j if smallest > j
        end
    end
    smallest
end

# p my_min1(list)

# PHASE 2

def my_min2(arr)
    smallest = arr.first

    arr.each do |i|
        smallest = i if smallest > i
    end

    smallest
end

# p my_min2(list)

# Largest Contiguous Sub-sum

list = [2, 3, -6, 7, -6, 7]

# PHASE 1

def largest_contiguous_sub_sum1(arr)
    subarrays = []
    arr.each_with_index do |num1, i|
        arr.each_with_index do |num2, j|
            subarrays << arr[i..j] if i <= j
        end
    end

    subarrays.map! do |subarray|
        subarray.sum
    end

    subarrays.sort[-1]
end

p largest_contiguous_sub_sum1(list)

# PHASE 2

def largest_contiguous_sub_sum2(arr)
    #one varable tracks largest sum
    #one variable tracks current sum
    #O(n) + O(1)

    largest_sum= arr.first
    arr.each_with_index do |ele, idx|
        if ele > largest_sum
            largest_sum = ele
        end
        i = idx
        sum = ele
        while i < arr.length-1
            if sum <= sum + arr[i+1]
                sum = sum + arr[i+1]
                largest_sum = sum
                i+=1
            else 
                break
            end
        end
    end
    largest_sum
end

p largest_contiguous_sub_sum2(list)