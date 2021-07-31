

# NAIVE SOLUTION

def naive_windowed_max_range(arr, w)
    current_max_range= nil
    (0..arr.length-w).each do |idx|
        window= arr[idx...idx+w]
        max= window.max
        min= window.min
        if current_max_range==nil || current_max_range < max-min
            current_max_range= max-min
        end
    end

    current_max_range
end

# p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 2)   # 4, 8
# p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 3)  # 0, 2, 5
# p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 4)  # 2, 5, 4, 8
# p naive_windowed_max_range([1, 3, 2, 5, 4, 8], 5)  # 3, 2, 5, 4, 8


#   OPTIMIZED SOLUTION

class MyQueue

    def initialize
        @store= []
    end

    def enqueue(ele)
        @store<< ele
    end

    def dequeue
        @store.shift
    end

    def peek
        self.store[0]
    end

    def size
        self.store.length
    end

    def empty?
        self.store.empty?
    end

end