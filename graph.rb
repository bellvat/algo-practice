#creating a graph class
#

class Vertex
	attr_accessor :label, :visited
	def initialize(lab)
		@visited = false
		@label = lab
	end
end

class Graph
	def initialize
		@max_vert = 20
		@vertex_list = Array.new
		@adj_mat = Array.new(20){Array.new(20)}
		@current_vert = 0
		0...@max_vert.each do |i|
			0...@max_vert.each do |j|
				@adj_mat[i][j] = 0
			end
		end
	end
	
	def add_vert(lab)
		@vertex_list[@current_vert] = Vertex.new(lab)
		@current_vert += 1
	end
	
	def add_edge(start,e_end)
		@adj_mat[start][e_end] = 1
		@adj_mat[e_end][start] = 1
	end

	def display_vert(ind)
		p @vertex_list[ind].label
	end

	def get_adj_vertex(v)
		@current_vert.times do |i|
			if @adj_mat[v][i] == 1 && @vertex_list[i].visited == false
				return i
			end
		end
		return -1
	end

	def dfs
		#start at root, find the first adj vertex
		#edge
		stack = []
		@vertex_list[0].visited = true
		display_vert(0)
		stack << 0
		while !stack.empty?
			next_vert = get_adj_vertex(stack[0])
			if next_vert == -1
				stack.pop
			else
				@vertex_list[next_vert].visited = true
				display_vert(next_vert)
				stack << next_vert
			end
		end
				
	end
end
