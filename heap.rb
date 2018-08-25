#Writing code for inserting element into heap
#Process: Insert into the last element, then bubble up through the heap, to find where it can be inserted. Must be inserted below a root that is higher than itself
#Question: So in a heap, we are storing  nodes in an array?
class Node
  attr_accessor :key
  def initialize(key=nil)
    @key = key
  end
end
class Heap
  def initialize
    @arr = Array.new
  end

  def insert(key)
    new_node = Node.new(key)
    len = @arr.length
    @arr[len] = new_node
    len += 1
    trickle_up(len)
  end

  def trickle_up(ind)
    parent = (ind-1)/2
    node_bottom = @arr[ind]
    while ind > 0 && @arr[parent].key > node_bottom.key #havent defined index, which is getting the index, or key of the node..? or index of the array element..?
      @arr[ind] = @arr[parent]
      ind = parent
      parent = (parent-1)/2

    end
    @arr[ind] = node_bottom
  end
  def remove(top)
   #remove the root, which is the first element in the array
   #replace the last node at the root, then trickle down, to find where the key is less than the child of the root, need to compare which child is lower
    len = @arr.length
     @arr[0] = @arr[len-1]
     len -= 1
     trickle_down
  end
  def trickle_down
    len = @arr.length
    ind = 0
    node_top = @arr[ind]
    node_left = 2*ind + 1
    node_right = 2*ind + 2
    parent = (ind-1)/2
    while ind < (len-1) && (@arr[ind].key < @arr[node_left].key || @arr[ind].key < @arr[node_right].key)
      if @arr[node_left].key > @arr[node_right].key
      end
    end

  end
end
