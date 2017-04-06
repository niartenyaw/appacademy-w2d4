
# TC : O(n**2)
def two_sum_brute(arr, target)
  (0...arr.length-1).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end
  false
end

#TC O(n log n)
def two_sum_sorting(arr, target)
  arr_sorted = arr.sort
  small_idx = 0
  large_idx = arr.length - 1

  until small_idx == large_idx
    case arr_sorted[small_idx] + arr_sorted[large_idx] <=> target
    when 0
      return true
    when 1
      large_idx -= 1
    when -1
      small_idx += 1
    end
  end
  false
end

def two_sum_hash(arr, target)
  hash = Hash.new
  diff_hash = Hash.new(false)

  arr.each do |el|
    hash[el] = el
  end

  arr.each do |el|
    diff_hash[target - el] = true
  end

  hash.each_value do |v|
    return true if diff_hash[v]
  end
  false
end

def four_sum? (arr, target)
  arr_sorted = arr.sort # n log n

  min = arr_sorted[0] + arr_sorted[1]
  max = arr_sorted[-1] + arr_sorted[-2]

  upper = (target + 1) / 2
  lower = target / 2

  while upper < max || lower > min
    return true if two_sum_hash(arr, upper) && two_sum_hash(arr, lower)
    upper += 1
    lower -= 1
  end

  false
end


def bad_four_sum?(arr, target)
  options_arr = arr.combination(4)

  return true if options_arr.any? { |arr| arr.inject(:+) == target }
  false
end
