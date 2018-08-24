class Node
	def initialize(data=nil, left=nil, right=nil)
		@data = data
		@left = left
		@right = right
	end
end
class Heap
	#
	#
	def initialize
		@arr = Array.new
	end

	def insert(data)
		
	end

	def remove(data)
		#remove the first, since this is something like a priority queue, remove the root
		#insert the last node at the first(root)
		#then you trickle down, compare left and right child, which ever one is bigger, you swap it
		#do i need to know the parent?
		@arr[0] = @arr[@arr.length-1]
		first = @arr[0]
		trickle_down(0)

	end
	def trickle_up()
	end
	def trickle_down(ind)
		larger_child = 0
		top = @arr[ind]
		len = @arr.length
		while ind < len/2
			left_child = 2*ind + 1
			right_child = left_child + 1

			if right_child < len && left_child.data < right_child.data
				larger_child = right_child
			else
				larger_child = left_child
			end

			if top.data >= @arr.larger_child.data
				break
			end
			@arr[ind] = @arr[larger_child]
			ind = larger_child
		end
	end
end
