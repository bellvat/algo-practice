def perm?(sone,stwo)
#Permutation is a different order of a set of elements (abc), perm is bca or cab
#1. Need to check if all letters are present
#2. Need to check if one letter is in a different order
# Store letter and order in a hash in an array
# iterate through stwo, and user include? method

  if sone.length != stwo.length
    return false
  elsif sone.chars.sort != stwo.chars.sort
    return false
  else
    return true
  end
end

def perm2?(sone,stwo)
  #store count in hash{letter: count}
  #use t to subtract numbers from count
  # if not zero, or letter not found, then false
  tab = Hash.new
  sone.chars.each do |e|
    tab[e] ||= 0
    tab[e] += 1
  end
  stwo.chars.each do |f|
    if tab[f].nil?
      return false
    else
      tab[f] -= 1
    end
  end
  tab.values.each do |r|
    return false if r != 0
  end
  return true 
end
sone = "hella"
stwo = "holla"
p perm2?(sone,stwo)
