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

# p largest_contiguous_sub_sum1(list)

# PHASE 2

def largest_contiguous_sub_sum2(arr)
    #one varable tracks largest sum
    #one variable tracks current sum
    #O(n) + O(1)
    # list = [2, 3, -6, 7, -6, 7]

    # largest_sum= arr.first

    # i = 0
    # arr_end = true

    # while arr_end
    #     current_sum = arr[i]
    #     if arr[i+1] == nil
    #         arr_end = false
    #         puts "This is current sum: #{current_sum}"
    #     else
    #         if current_sum > largest_sum
    #             current_sum += arr[i+1]
    #             largest_sum = current_sum
    #         end
    #     end
    #     if i < arr.length
    #         arr_end = true
    #         i += 1
    #     end
    # end
    # largest_sum
    


    # arr.each_with_index do |ele, idx|
    #     if ele > largest_sum
    #         largest_sum = ele
    #     end

    #     i = idx
    #     sum = ele
    #     while i < arr.length - 1
    #         if sum <= sum + arr[i+1]
    #             largest_sum = sum + arr[i+1]
    #         end
    #         sum = sum + arr[i+1]
    #         i+=1
    #     end
    # end
    # largest_sum

end

# p largest_contiguous_sub_sum2(list)
#i (0)    (1)    (2)    (3)    (4)    (5)
#   4      3     -6      7     -6      7

#   2+3 =  5
#          5-6  =-1
#                -1+7  = 6
#                        6-6  = 0
#   
#   
#                        7-6  = 1
#                               1+7  = 8     ==> 8
#   
#   
#   
#                 -6+7 = 1
#   
#          3-6= -3
#   
#   2+3 = 5

def largest_contiguous_sub_sum3(arr)

    largest_sum = arr.first
    current_sum = arr.first

    (1...arr.length).each do |index|
        current_num = arr[index]
        prev_num = arr[index-1]

        if largest_sum < current_num
            largest_sum = current_num
        end

        current_sum = current_sum + current_num
        prev_sum = prev_num + current_num

        if prev_sum > current_sum
            current_sum = prev_sum
        end

        if largest_sum < current_sum
            largest_sum = current_sum
        end
    end
    largest_sum
end

list = [2, 3, -6, 7, -6, -7]
list2 = [-5, -1, -3]
p largest_contiguous_sub_sum3(list)
p largest_contiguous_sub_sum3(list2)