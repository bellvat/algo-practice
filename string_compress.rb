#compress a string
# from aabccc -> a2b1c3
# if the length of the compressed string is equal to the original, return original
# i have to know the count of the letter, and remake it into a new string?
# i can use a hash?{letter -> count} then print the keys and values
def compress(s)
  hash = Hash.new
  s.chars.each do |n|
    hash[n] ||= 0
    hash[n] += 1
  end
  str = ""
  hash.each_pair do |key, value|
    str += "#{key}#{value}"
  end

  if str.size < s.size
    p str
  else
    p s
  end

end
#compress("aabbbbbbbbbbcc")
def better_compress(s)
  mystr = ""
  last = str[0]
  count = 1

end


def count_compression(str)
  mystr = ""
  last = str[0]
  count = 1
# catch cases where there is no string
  if str.nil? || str.empty?
    return 0
  else
#iterate through the string, if the letter is the same as the last, add that to 'count', if not the same, write the letter and count to string variable (mystr), set the count back to 1, and the last variable to the current new letter
    (1..str.size).each do |i|
      if str[i] == last
	count += 1
      else
	mystr += last + count.to_s
	last = str[i]
	count = 1;
      end
    end
  end
  p mystr
end
count_compression("aaabbbbbbbccd")

