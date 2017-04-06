
# TC : n**2
def two_sum_brute(arr, target)
  (0...arr.length-1).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end
  false
end

def two_sum_sorting(arr, target)
  

end
