class List
	attr_accessor :head
	def initialize(data)
		@head = Node.new(data)
	end

	def insertFirst(data, nextNode = nil)
		newList = Node.new(data)
		newList.nextNode = @head #first node
		@head = newList
	end

	def display
		first = @head
		while first != nil
			first.view
			first = first.nextNode
		end
	end

	def deleteFirst
		@head = @head.nextNode
	end
	
	def deleteTarg(target)
		first = @head
		while first != nil
			if first.data == target
				break
			else
				previous = first #set previous to hold the previous one in order to set the previous to the next node, deleting the one in the middle
				first = first.nextNode
			end
			puts first, "first"
			puts previous, "previous"
		end
		previous.nextNode = first.nextNode
	end

	def find(target)
		first = @head
		while first != nil
			if first.data == target
				puts "We found your target!"
				break
			else
				first = first.nextNode
			end
		end
	end
end

class Node
	attr_accessor :data, :nextNode 
	def initialize(data, nextNode=nil)
		@data = data
		@nextNode = nextNode
	end

	def view
		puts "This is the data #{@data} and next node #{@nextNode}"
	end
end
