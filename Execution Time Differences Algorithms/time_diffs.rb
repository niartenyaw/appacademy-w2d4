# Time complexity of n**2
def my_min(array)
  array.each do |el|
    min = true
    array.each do |al|
      min = false if el > al
    end
    return el if min
   end
end

#TC of n
def my_min_ii(array)
  min = nil
  array.each do |el|
    min = el unless min
    min = el if el < min
  end
  min
end


# TC : n**2
def largest_sub_sum(array)
  sub_sets = []
  array.each_index do |i|
    (i...array.length).each do |j|
      sub_sets << array[i..j]
    end
  end

  max = nil

  sub_sets.each do |el|
    max = el unless max
    max = el if el.inject(:+) > max.inject(:+)
  end
  max.inject(:+)
end


def largest_sub_sum_ii(array)
  start_idx = 0
  end_idx = 0
  current_sum = array[0]
  max = array[0]
  (0...array.length).each do |i|
    current_sum = array[start_idx..end_idx].inject(:+)
    max = current_sum if current_sum > max
    if current_sum < 0
      start_idx = i + 1
    end
    end_idx = i + 1
  end
  max
end
