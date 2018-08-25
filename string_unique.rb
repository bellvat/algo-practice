def string_unique(s)
  len = s.length - 1
  unique = true
  (0..len).each do |t|
    (0..len).each do |n|
      next if t == n
      if s[t] == s[n]
	p "Not Unique"
	unique = false
	break
      end
      break if unique == false
    end
  end
  p "Unique!" if unique == true
end
s = "hely"
#string_unique(s)
#below is a method in which we are creating unicode characters in an array OR we can set a an
#then we are iterating over the string. Once the letter matches a character in the array, we turn it to be true
def string_unique?(s)
  bool_alpha = Array.new(256)
  len = s.length - 1
  (0..len).each do |n|
    var = s[n]
    if bool_alpha.include?(var)
      return false
    else
      bool_alpha[n] = var
    end
  end
  return true
end
#There are two approaches:
# 1. I did as above, which set an element in an array to the character. ex: [a, nil,nil,nil]
# Then I try to find if that character exists, using .include?()
# 2. I make an array of booleans, initially set to nil. I think this is only possible in Java, where you
# assign a value to true or false, like: arr['n'] = true. I dont think thats possible in ruby??
s = "helo"
p string_unique?(s)
