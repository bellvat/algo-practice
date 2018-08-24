#adding numbers from a linked list
#its actually easier to add that way! add from the first root of both lists, and move down

class Node
	attr_accessor :payload, :next
	def initialize(data=nil, next_node=nil)
		@payload = data
		@next = next_node
	end
end
class List
	attr_accessor :root
	def initialize
		@root = Node.new
	end

	def add_list(list_a,list_b)
		current_a = list_a
		current_b = list_b
		@new_list = List.new
		add_one = false
		while !current_a.nil?
			sum = current_a.payload + current_b.payload
			if add_one
				sum += 1
			end
			add_to_list(sum)	
			if sum % 10 == 0
				add_one = true
			else
				add_one = false
			end
			current_a = current_a.next
			current_b = current_b.next
		end
		p @new_list

	end

	def add_to_list(sum)
		new_node = Node.new(sum)
		if @root == nil
			@root = new_node
		else
			new_node.next = @root
			@root = new_node
		end
	end

end

c = Node.new(5)
b = Node.new(4,c)
a = Node.new(3,b)
f = Node.new(5)
e = Node.new(4,f)
d = Node.new(3,e)

g = List.new
g.add_list(a,d)
