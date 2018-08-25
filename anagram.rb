#anagrams are similar to factorials
#for each count, there are n! times the words can be assembled
#need to rotate letter for each
#if i pick a word, rotate, start with r , then 'otate', there are 5 remaining, so there can be a combo of 5!
class AnagramApp
def initialize(str)
  @arr = str.chars
  @str_size = str.size
  doAna(@str_size)
end

def doAna(siz)
  if siz == 1
    return
  end
  (0...siz).each do |j|
    doAna(siz-1)
    if siz == 3
      p @arr
    end
    rotate(siz)
  end
end

def rotate(siz)
  position = @str_size - siz
  temp = @arr[position]
  j = position + 1
  l = 0
  (j...@str_size).each do |m|
    l = m
    @arr[m-1] = @arr[m]
    puts "this is arr #{@arr}"
  end
  @arr[l-1] = temp
end
end
