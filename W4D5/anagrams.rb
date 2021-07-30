
#  PHASE I


def first_anagram?(str1, str2)

    chars= str1.split("")
    possible= chars.permutation.to_a
    possible.map! {|el| el.join("")}

    possible.include?(str2)
end
#time complexity = O(n!)

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true
# p first_anagram?("abcdefghij", "jihgfedcba")

#   PHASE II

def second_anagram?(str1, str2)
    str1.each_char do |char|
        if !str2.include?(char)
            return false
        else
            str2= str2[0...str2.index(char)]+ str2[str2.index(char)+1..-1]
        end
    end

    return true if str2.length == 0
    false
end

#time complexity = O(n^2)

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true
# p second_anagram?("abcdefghij", "jihgfedcba")


#   PHASE III

def third_anagram?(str1, str2) # O(n log n)
    mergesort(str1.split(""))== mergesort(str2.split(""))
end

def mergesort(arr) # O(log n)
    return arr if arr.length<=1
    
    mid= arr.length/2
    leftsort= mergesort(arr[0...mid])
    rightsort= mergesort(arr[mid..-1])
    merge(leftsort, rightsort)
end

def merge(left, right) # O(n)
    result=[]

    until left.empty? || right.empty?
        if (left.first <=> right.first) == 1
            result<< left.shift
        elsif (left.first <=> right.first) ==0
            result<< left.shift
        else
            result<< right.shift
        end
    end
    result+left+right
end


# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true
# p third_anagram?("abcdefghij", "jihgfedcba") 


#   PHASE IV

def fourth_anagram?(str1, str2)
    hash1= make_hash(str1)
    hash2= make_hash(str2)
    hash1==hash2
end

def make_hash(str)
    counter= Hash.new(0)

    str.each_char do |char|
        counter[char]+=1
    end
    counter
end

# O(2n) == O(n)

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
p fourth_anagram?("abcdefghij", "jihgfedcba") 