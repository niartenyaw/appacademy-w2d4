
# TC : n * n!
def anagrams_i(str, ana)
  anagrams = permutations(str.split("")).map(&:join)

  anagrams.include?(ana)
end

# TC : n**2
def anagrams_ii(str, ana)
  return false if ana.length != str.length
  return true if ana.length == 0


  first_a = ana[0]
  idx_str = str.index(first_a)

  return false if idx_str.nil?

  anagrams_ii(str[0...idx_str] + str[idx_str+1..-1], ana[1..-1])
end

# TC : n + nlog(n) => n log n
def anagrams_iii(str, ana)

  str_r = str.split("").sort
  ana_r = ana.split("").sort

  str_r == ana_r
end

# TC : 3n => n
def anagrams_iv(str, ana)
  str_hash = Hash.new(0)

  ana_hash = Hash.new(0)

  str.chars.each do |ch|
    str_hash[ch] += 1
  end

  ana.chars.each do |ch|
    ana_hash[ch] += 1
  end

  str_hash == ana_hash
end

# TC 3n => n
def anagrams_v(str, ana)
  hash = Hash.new(0)

  str.chars.each do |ch|
    hash[ch] += 1
  end

  ana.chars.each do |ch|
    hash[ch] -= 1
  end

  hash.all? { |_, v| v == 0 }
end


def permutations(arr)
  return [arr] if arr.length < 2

  set = []
  arr.each_with_index do |el, i|
    dup_arr = arr.dup
    dup_arr.delete_at(i)
    prev = permutations(dup_arr)
    prev.each do |perm|
      set << [el] + perm
    end
  end

  set
end
