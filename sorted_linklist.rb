#insert at the the sorted space, 
#and deleting from the beginning
#
class Node
	def initialize(data, next_node = nil)
		@data = data
		@next = next_node
	end
	
	def display
		puts "This is the data #{@data} and this is next #{next}"
	end

end

class SortedList
	def initialize
		@head = Node.new(nil)
	end
	def insert(data)
		new_node = Node.new(data)
		first = @head
		if first.data == nil
			first = new_node
		else
			while first != nil
				if data > first.data
					previous = first
					first = first.next
				elsif data < first.data
					previous.next = new_node
					new_node.next = first
					break
				end
			end
		end

	end
end
