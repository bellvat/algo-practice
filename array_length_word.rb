#find the length of the last word in a string, if last word doesn't exist, return 0

def last_word_length(str)
  #separate the string by blank spaces into array
  #then use string.size to count the word
  arr = str.split(' ')
  if !arr.empty?
    puts arr[-1].size
  else
    puts 0
  end
end

last_word_length('find her here now')
