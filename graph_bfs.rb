class Vertex
  def initialize(label=nil)
    @label = label
    @visited = nil
  end
end
class Graph
  def initialize
    @vertex_list = Array.new
    @count_vertex = 0
    @adj_matrix = Array.new(20){Array.new(20)}
  end

  def find_next(ind)
    @count_vertex.times do |j|
      if @adj_matrix[ind][j] == 1 && @vertex_list[j].visited == false
        return j
      end
    end
    return -1
  end
  def dfs
    #find the valid next vertex, then the next one, the next one, until there is none, then you remove it from the stack, and search the next one
    @vertex_list[0].visited = true
    display(0)
    stack = []
    stack << 0
    while !stack.empty?
      next_node = find_next(stack[0]) #the top of the stack
      if next_node == -1
        stack.pop
      else
        @vertex_list[next_node].visted = true
        display(next_node)
        stack << next_node
      end
    end
  end
  def bfs
    #you find the current node, then you find all that is adjacent to it
    #find adjacent until you cant, then you go to the next element in the q
    @vertex_list[0].visited = true
    displayVertex(0)
    q << 0
    v2 = 0 #index of the next visited node
    while !q.empty?
      v1 = q.shift #index of the list that is popped
      while (v2 = find_next(v1)) != -1
        vertex_list[v2].visited = true
        displayVertex(v2)
        q << v2
      end
    end
  end
  def bfs1
    q = Array.new
    ind = 0
    current = @vertex_list[ind]
    q << ind
    while !q.empty == false
      next_node = find_next(ind)
      if next_node > -1 
        @vertex_list[next_node].visited = true 
        display(next_node)
        q << next_node
      else
        q.shift
      end
    end
  end
end
