require 'pry-byebug'

def merge_sort(arr)
  if arr.length < 2
    arr
  else
    left_arr = []
    right_arr = []
    for i in 0...arr.length
      if i < arr.length / 2
        left_arr << arr[i]
      else
        right_arr << arr[i]
      end
    end
    left_sort = merge_sort(left_arr)
    right_sort = merge_sort(right_arr)
    merged = []
    i = 0
    j = 0
    until i > left_sort.length - 1 || j > right_sort.length - 1
      if left_sort[i] < right_sort[j]
        merged << left_sort[i]
        i +=1
      elsif left_sort[i] > right_sort[j]
        merged << right_sort[j]
        j +=1
      elsif left_sort[i] == right_sort[j]
        merged << left_sort[i]
        merged << right_sort[j]
        i += 1
        j += 1
      end
    end
    if i < left_sort.length
      i.upto(left_sort.length - 1) { |n| merged << left_sort[n] }
    elsif j < right_sort.length
      j.upto(right_sort.length - 1) { |n| merged << right_sort[n] }
    end
    merged
  end
end

def merge_sort_clean(arr)
  return arr if arr.length < 2

  sorted_left = merge_sort_clean(arr[0...arr.length/2])
  sorted_right = merge_sort_clean(arr[arr.length/2..-1])
  merged_arr = []

  until sorted_left.empty? || sorted_right.empty?
    if sorted_left.first < sorted_right.first
      merged_arr << sorted_left.shift
    elsif sorted_right.first < sorted_left.first
      merged_arr << sorted_right.shift
    else
      merged_arr << sorted_left.shift
      merged_arr << sorted_right.shift
    end
  end
  merged_arr + sorted_left + sorted_right
end

p merge_sort_clean([9, 1, 4, 1, 7, 2, 5])
