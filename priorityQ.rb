# i am trying to implement a queue, first in first out
#inserting elements into the array in the correct order, ascending

class Priority
  def initialize
    @arr = []
  end

  def insert(n)
    nItems = 0
    r = 0
    if @arr.empty?
      @arr << n  
      nItems += 1
    else
      ((nItems-1)..0).each do |e|
        if n > @arr[e]
          @arr[e+1] = @arr[e]
        else
         break 
        end
        r = e
      end
      puts r
        @arr[r+1] = n
        nItems += 1
    end

  end
end
