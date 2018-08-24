#reorder the linked list
#L0 -> L1 -> L2 -> L3 -> Ln
#to L0 > Ln > L1 > L(n-1) > L2 > L(n-2)

class Node
	attr_accessor :data, :next
	def initialize(data,next_node=nil)
		@data = data
		@next_node = next_node
	end
end
class List
	def initialize
		@root = Node.new(data)
	end

	def reorder(list)
		list1 = 
	end
end
