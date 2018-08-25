#word ladder bfs...
#from the root, generate all possible combinations of the character in each word -> check the word with the list of words given in the array -> Set the new word -->Repeat
#make a queue as an array?

class WordNode
  attr_accessor :word
  def initialize(word)
    @word = word
    @num_steps = 0
  end
end

def solution(begw,endw,dict)
  dict << endw
  queue = []
  queue << WordNode.new(begw)
  while !queue.empty?
    top = queue.shift
    top_word = top.word
    original = top_word.chars
    arr_top_word = original
    (0..(begw.length-1)).each do |e|
      ('a'..'z').each do |ch|
        temp = arr_top_word[e]
        arr_top_word[e] = ch
        if dict.include?(arr_top_word.to_s)
          p 'here?'
          queue << WordNode.new(arr_top_word.to_s)
          dict.delete_if{|i| i == arr_top_word.to_s}
        end
        arr_top_word[e]=temp
      end
    end
  end
end

solution('hit','cog',['hot','dot','dog','lot','log'])
