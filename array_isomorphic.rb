#isomorphic means comparing 2 strings, if switch characters, can produce the other string, love and hate are isomorphic.. or egg and add
#This means one character can only be mapped to one other one
#i can map one character, and compare the places of the character in the second string, like cat, bat, map c->b, then map the indices of b, then compare indeces of remaining c?
#map out each unique character in first string, then compare the pattern to the second string
#map each new character to a number, 
#in java can use Hash map, which i kind of use here..?

def isomorph(str1, str2)
  astr1 = str1.chars
  astr2 = str2.chars
  htable1 = Hash.new
  htable2 = Hash.new
  astr1.each_with_index do |e,ind|
    htable1[e] ||= []
    htable1[e] << ind
  end
  astr2.each_with_index do |e,ind|
    htable2[e] ||= []
    htable2[e] << ind
  end
  p htable1.values
  p htable2.values
  minus = htable1.values - htable2.values
  p minus
  if minus.empty? 
    return true
  else
    return false
  end

end

puts isomorph('cat','bat')
puts isomorph('cate','bat')
puts isomorph('egg','add')
puts isomorph('spade','trunk')
